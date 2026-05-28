import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/utils/device_info_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_requests.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/data/repositories/attendance_repository.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    
    Future<void> requestOTP() async {
      isLoading.value = true;
      try {
        final result = await ref
            .read(attendanceRepositoryProvider)
            .requestOTP(sessionId);
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

        final result = await ref
            .read(attendanceRepositoryProvider)
            .verifyOTP(request);

        result.fold(
          ifLeft: (failure) => throw failure.message,
          ifRight: (_) {
            if (context.mounted) {
              ShadToaster.of(context).show(
                const ShadToast(
                  description: Text('Attendance marked successfully!'),
                ),
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
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(
          message: err is Failure ? err.message : 'Something went wrong.',
          onRetry: () => ref.invalidate(sessionDetailsProvider(sessionId)),
        ),
        data: (session) {
          if (session == null) {
            return const Center(child: Text('Session not found'));
          }

          return SafeArea(
            child: Column(
              children: [
                // Custom Borderless Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      const BackButton(),
                      const SizedBox(width: 8),
                      const Text(
                        'Mark Attendance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SessionHeader(session: session),
                        const SizedBox(height: 48),

                        ShadButton(
                          size: ShadButtonSize.lg,
                          onPressed: isLoading.value
                              ? null
                              : () =>
                                    context.push('/scan?sessionId=$sessionId'),
                          child: isLoading.value
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(LucideIcons.qrCode, size: 20),
                                    SizedBox(width: 12),
                                    Text('Scan QR Code'),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 16),

                        ShadButton.outline(
                          size: ShadButtonSize.lg,
                          onPressed: isLoading.value ? null : requestOTP,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(LucideIcons.keySquare, size: 20),
                              SizedBox(width: 12),
                              Text('Request OTP'),
                            ],
                          ),
                        ),

                        if (otpResponse.value != null) ...[
                          const SizedBox(height: 32),
                          // Shadcn-style bordered container instead of standard Card
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).dividerColor.withValues(alpha: 0.3),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Your OTP Code',
                                  style: ShadTheme.of(context).textTheme.muted,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  otpResponse.value!.otpCode,
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 8,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Expires at: ${otpResponse.value!.expiresAt}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ShadInput(
                                  controller: otpController,
                                  placeholder: const Text(
                                    'Enter OTP to verify',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(height: 16),
                                ShadButton(
                                  onPressed: isLoading.value ? null : verifyOTP,
                                  width: double.infinity,
                                  child: const Text('Verify OTP'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SessionHeader extends StatelessWidget {
  final SessionModel session;

  const _SessionHeader({required this.session});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            LucideIcons.mapPin,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title,
          style: ShadTheme.of(context).textTheme.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.radio, size: 14, color: Colors.green),
              SizedBox(width: 6),
              Text(
                'SESSION ACTIVE',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
