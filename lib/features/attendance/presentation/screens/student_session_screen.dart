import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/utils/device_info_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_requests.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/data/repositories/attendance_repository.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StudentSessionScreen extends HookConsumerWidget {
  final String sessionId;

  const StudentSessionScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionDetailsProvider(sessionId));
    final otpResponse = useState<OTPResponse?>(null);
    final otpController = useTextEditingController();
    final isLoading = useState(false);

    Future<void> markWithQR(String token) async {
      isLoading.value = true;
      try {
        final data = await DeviceInfoHelper.getCollectionData();
        final request = MarkAttendanceQRRequest(
          sessionId: sessionId,
          qrToken: token,
          latitude: data['latitude'],
          longitude: data['longitude'],
          deviceId: data['deviceId'],
          deviceModel: data['deviceModel'],
          osVersion: data['osVersion'],
          mockLocationDetected: data['mockLocationDetected'],
        );

        final result = await ref.read(attendanceRepositoryProvider).markWithQR(request);
        
        result.fold(
          ifLeft: (failure) => throw failure.message,
          ifRight: (_) {
            if (context.mounted) {
              ShadToaster.of(context).show(
                const ShadToast(title: Text('Attendance marked successfully!')),
              );
              Navigator.pop(context);
            }
          },
        );
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to mark attendance'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> requestOTP() async {
      isLoading.value = true;
      try {
        final result = await ref.read(attendanceRepositoryProvider).requestOTP(sessionId);
        result.fold(
          ifLeft: (failure) => throw failure.message,
          ifRight: (response) => otpResponse.value = response,
        );
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to request OTP'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> verifyOTP() async {
      if (otpController.text.isEmpty) return;
      isLoading.value = true;
      try {
        final data = await DeviceInfoHelper.getCollectionData();
        final request = MarkAttendanceOTPRequest(
          sessionId: sessionId,
          otpCode: otpController.text.trim(),
          latitude: data['latitude'],
          longitude: data['longitude'],
          deviceId: data['deviceId'],
          deviceModel: data['deviceModel'],
          osVersion: data['osVersion'],
          mockLocationDetected: data['mockLocationDetected'],
        );

        final result = await ref.read(attendanceRepositoryProvider).verifyOTP(request);
        
        result.fold(
          ifLeft: (failure) => throw failure.message,
          ifRight: (_) {
            if (context.mounted) {
              ShadToaster.of(context).show(
                const ShadToast(title: Text('Attendance marked successfully!')),
              );
              Navigator.pop(context);
            }
          },
        );
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to verify OTP'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mark Attendance')),
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (session) {
          if (session == null) return const Center(child: Text('Session not found'));
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SessionHeader(session: session),
                const SizedBox(height: 32),
                
                ShadButton(
                  onPressed: isLoading.value ? null : () => _showScanner(context, markWithQR),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.qrCode, size: 18),
                      SizedBox(width: 10),
                      Text('Scan QR Code'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                ShadButton.outline(
                  onPressed: isLoading.value ? null : requestOTP,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.key, size: 18),
                      SizedBox(width: 10),
                      Text('Request OTP'),
                    ],
                  ),
                ),
                
                if (otpResponse.value != null) ...[
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text('Your OTP Code', style: TextStyle(fontSize: 12)),
                          Text(
                            otpResponse.value!.otpCode,
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Expires at: ${otpResponse.value!.expiresAt}',
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          ShadInput(
                            controller: otpController,
                            placeholder: const Text('Enter OTP to verify'),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 12),
                          ShadButton(
                            onPressed: isLoading.value ? null : verifyOTP,
                            width: double.infinity,
                            child: const Text('Verify OTP'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _showScanner(BuildContext context, Function(String) onScan) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Scan QR Code'),
        child: SizedBox(
          height: 300,
          width: 300,
          child: MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  Navigator.pop(context);
                  onScan(barcode.rawValue!);
                  break;
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SessionHeader extends StatelessWidget {
  final dynamic session;
  const _SessionHeader({required this.session});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(LucideIcons.calendarDays, size: 48),
        const SizedBox(height: 16),
        Text(
          session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title,
          style: ShadTheme.of(context).textTheme.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
          ),
          child: const Text(
            'SESSION ACTIVE',
            style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
