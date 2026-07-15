import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/utils/device_info_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_requests.dart';
import 'package:geotas/features/attendance/presentation/widgets/qr_scanner_overlay_shape.dart';
import 'package:geotas/features/attendance/providers/attendance_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ScanScreen extends HookConsumerWidget {
  /// If provided, skips extracting session_id from the QR payload.
  /// Used when navigating from StudentSessionScreen where session is already known.
  final String? sessionId;

  const ScanScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useState<String?>(null);
    final error = useState<String?>(null);
    final isLoading = useState(false);
    final isScanned = useState(false);

    final cameraController = useMemoized(() => MobileScannerController());
    useEffect(() => cameraController.dispose, const []);

    Future<void> processToken(String scannedValue) async {
      if (isScanned.value) return;
      final rawValue = scannedValue.trim();
      if (rawValue.isEmpty) return;

      isScanned.value = true;
      isLoading.value = true;
      error.value = null;

      await cameraController.stop();

      try {
        final Map<String, dynamic> payload;
        try {
          payload = json.decode(rawValue) as Map<String, dynamic>;
        } catch (_) {
          throw 'Invalid QR code. Please scan a GEOTAS QR code.';
        }

        final token = payload['token'] as String?;
        final payloadSessionId = payload['session_id'] as String?;

        if (token == null) {
          throw 'Invalid QR code. Please scan a GEOTAS QR code.';
        }

        // prefer injected sessionId (old flow), fall back to payload (FAB flow)
        final resolvedSessionId = sessionId ?? payloadSessionId;
        if (resolvedSessionId == null) {
          throw 'QR code does not contain a session ID.';
        }

        final data = await DeviceInfoHelper.getCollectionData();
        final request = MarkAttendanceQRRequest(
          sessionId: resolvedSessionId,
          qrToken: token,
          latitude: data['latitude'],
          longitude: data['longitude'],
          deviceId: data['deviceId'],
          deviceModel: data['deviceModel'],
          osVersion: data['osVersion'],
          mockLocationDetected: data['mockLocationDetected'],
        );

        await ref.read(markAttendanceProvider.notifier).withQR(request);
        result.value = 'Attendance marked successfully!';
        
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    void resetScanner() {
      result.value = null;
      error.value = null;
      isScanned.value = false;
      cameraController.start();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              for (final barcode in capture.barcodes) {
                if (barcode.rawValue != null) {
                  processToken(barcode.rawValue!);
                  break;
                }
              }
            },
          ),

          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: QrScannerOverlayShape(
                  borderColor: ShadTheme.of(context).colorScheme.primary,
                  borderRadius: 12,
                  borderLength: 32,
                  borderWidth: 8,
                  cutOutSize: 280,
                ),
              ),
            ),
          ),

          if (!isLoading.value && result.value == null && error.value == null)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Position QR code in frame',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

          if (isLoading.value || result.value != null || error.value != null)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.4),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: _buildOverlayState(
                        context,
                        isLoading.value,
                        result.value,
                        error.value,
                        resetScanner,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOverlayState(
    BuildContext context,
    bool isLoading,
    String? result,
    String? error,
    VoidCallback onReset,
  ) {
    if (isLoading) {
      return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: ShadTheme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text('Verifying...', style: ShadTheme.of(context).textTheme.h4),
            const SizedBox(height: 8),
            Text(
              'Please do not close the app.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      );
    }

    final isSuccess = result != null;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: ShadTheme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSuccess
              ? Colors.green.withValues(alpha: 0.3)
              : ShadTheme.of(context).colorScheme.destructive.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSuccess ? LucideIcons.circleCheckBig : LucideIcons.circleX,
            size: 64,
            color: isSuccess ? Colors.green : ShadTheme.of(context).colorScheme.destructive,
          ),
          const SizedBox(height: 24),
          Text(
            isSuccess ? 'Success!' : 'Failed',
            style: ShadTheme.of(context).textTheme.h3,
          ),
          const SizedBox(height: 8),
          Text(
            result ?? error ?? '',
            textAlign: TextAlign.center,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 32),
          if (isSuccess)
            ShadButton(
              width: double.infinity,
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            )
          else
            ShadButton.outline(
              width: double.infinity,
              onPressed: onReset,
              child: const Text('Try Again'),
            ),
        ],
      ),
    );
  }
}
