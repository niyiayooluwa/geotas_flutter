import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/utils/device_info_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_requests.dart';
import 'package:geotas/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ScanScreen extends HookConsumerWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useState<String?>(null);
    final error = useState<String?>(null);
    final isLoading = useState(false);
    final isScanned = useState(false);

    // 1. Create a controller to safely manage the hardware feed
    final cameraController = useMemoized(() => MobileScannerController());

    // Safely dispose of the camera when the user leaves the screen entirely
    useEffect(() {
      return () => cameraController.dispose();
    }, const []);

    Future<void> processToken(String scannedValue) async {
      if (isScanned.value) return;

      final rawToken = scannedValue.trim();
      if (rawToken.isEmpty) return;

      isScanned.value = true;
      isLoading.value = true;
      error.value = null;

      // 2. PAUSE THE HARDWARE: Freeze the camera feed before doing anything else
      await cameraController.stop();

      try {
        String tokenToDecode = rawToken;

        if (rawToken.startsWith('http')) {
          try {
            final uri = Uri.parse(rawToken);
            tokenToDecode = uri.queryParameters['token'] ?? rawToken;
          } catch (_) {}
        }

        final claims = _decodeJWT(tokenToDecode);
        final sessionId = claims['session_id'] as String?;
        if (sessionId == null) throw 'Token does not contain session ID';

        final data = await DeviceInfoHelper.getCollectionData();
        final request = MarkAttendanceQRRequest(
          sessionId: sessionId,
          qrToken: tokenToDecode,
          latitude: data['latitude'],
          longitude: data['longitude'],
          deviceId: data['deviceId'],
          deviceModel: data['deviceModel'],
          osVersion: data['osVersion'],
          mockLocationDetected: data['mockLocationDetected'],
        );

        final markResult = await ref
            .read(attendanceRepositoryProvider)
            .markWithQR(request);

        markResult.fold(
          ifLeft: (failure) => throw failure.message,
          ifRight: (_) {
            result.value = 'Attendance marked successfully!';
          },
        );
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
      // Restart the camera feed so they can try again
      cameraController.start();
    }

    return Scaffold(
      // Ensure the scaffold extends behind the app bar for a full-screen camera look
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // 3. Keep everything in a Stack so the camera never unmounts
      body: Stack(
        children: [
          // --- The Camera Layer ---
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  processToken(barcode.rawValue!);
                  break;
                }
              }
            },
          ),

          // --- The Cutout Overlay Layer ---
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

          // --- Text Prompt ---
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

          // --- The Frosted Glass Loading/Result Overlay ---
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

  // Extracted to keep the build method clean
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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(
              'Verifying Location...',
              style: ShadTheme.of(context).textTheme.h4,
            ),
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
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSuccess
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.red.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSuccess ? LucideIcons.circleCheckBig : LucideIcons.circleX,
            size: 64,
            color: isSuccess ? Colors.green : Colors.red,
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
              child: const Text('Return to Dashboard'),
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

  Map<String, dynamic> _decodeJWT(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw 'Invalid format. Verify you are scanning a GEOTAS QR code.';
      }

      final payload = parts[1];
      var normalized = payload.replaceAll('-', '+').replaceAll('_', '/');
      while (normalized.length % 4 != 0) {
        normalized += '=';
      }

      final decoded = utf8.decode(base64.decode(normalized));
      return json.decode(decoded) as Map<String, dynamic>;
    } catch (e) {
      if (e is String && e.startsWith('Invalid format')) rethrow;
      throw 'Failed to parse token: $e';
    }
  }
}

// Simple overlay shape since qr_code_scanner is not used
class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  const QrScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 10,
    this.borderRadius = 10,
    this.borderLength = 30,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRect(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;

    final cutOutRect = Rect.fromCenter(
      center: Offset(width / 2, height / 2),
      width: cutOutSize,
      height: cutOutSize,
    );

    // Paint background
    final backgroundPaint = Paint()..color = Colors.black54;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(rect),
        Path()..addRRect(
          RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
        ),
      ),
      backgroundPaint,
    );

    // Paint border corners
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path();

    // Top Left
    path.moveTo(cutOutRect.left, cutOutRect.top + borderLength);
    path.lineTo(cutOutRect.left, cutOutRect.top + borderRadius);
    path.arcToPoint(
      Offset(cutOutRect.left + borderRadius, cutOutRect.top),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(cutOutRect.left + borderLength, cutOutRect.top);

    // Top Right
    path.moveTo(cutOutRect.right - borderLength, cutOutRect.top);
    path.lineTo(cutOutRect.right - borderRadius, cutOutRect.top);
    path.arcToPoint(
      Offset(cutOutRect.right, cutOutRect.top + borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(cutOutRect.right, cutOutRect.top + borderLength);

    // Bottom Right
    path.moveTo(cutOutRect.right, cutOutRect.bottom - borderLength);
    path.lineTo(cutOutRect.right, cutOutRect.bottom - borderRadius);
    path.arcToPoint(
      Offset(cutOutRect.right - borderRadius, cutOutRect.bottom),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(cutOutRect.right, cutOutRect.bottom - borderLength);

    // Bottom Left
    path.moveTo(cutOutRect.left + borderLength, cutOutRect.bottom);
    path.lineTo(cutOutRect.left + borderRadius, cutOutRect.bottom);
    path.arcToPoint(
      Offset(cutOutRect.left, cutOutRect.bottom - borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(cutOutRect.left, cutOutRect.bottom - borderLength);

    canvas.drawPath(path, borderPaint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
