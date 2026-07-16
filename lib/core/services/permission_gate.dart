import 'package:flutter/material.dart';
import 'package:geotas/core/services/permissions_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PermissionGate extends StatefulWidget {
  final Widget child;
  const PermissionGate({super.key, required this.child});

  @override
  State<PermissionGate> createState() => _PermissionGateState();
}

class _PermissionGateState extends State<PermissionGate> {
  bool _checked = false;
  bool _locationGranted = false;
  bool _cameraGranted = false;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    final location = await PermissionService.requestLocation();
    final camera = await PermissionService.requestCamera();
    setState(() {
      _locationGranted = location;
      _cameraGranted = camera;
      _checked = true;
    });
  }

  Future<void> _retry() async {
    setState(() => _checked = false);
    await _check();
  }

  @override
  Widget build(BuildContext context) {
    if (!_checked) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final allGranted = _locationGranted && _cameraGranted;
    if (allGranted) return widget.child;

    // Show a blocking screen explaining what's needed
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lock_outline, size: 48),
              const SizedBox(height: 24),
              Text(
                'Permissions required',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: 8),
              Text(
                'GEOTAS needs the following to verify your attendance:',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(height: 24),
              _PermissionRow(
                icon: Icons.location_on_outlined,
                label: 'Precise location',
                granted: _locationGranted,
              ),
              const SizedBox(height: 12),
              _PermissionRow(
                icon: Icons.camera_alt_outlined,
                label: 'Camera (for QR scanning)',
                granted: _cameraGranted,
              ),
              const SizedBox(height: 32),
              ShadButton(
                onPressed: _retry,
                child: const Text('Grant permissions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool granted;

  const _PermissionRow({
    required this.icon,
    required this.label,
    required this.granted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: const TextStyle(fontSize: 14)),
        ),
        Icon(
          granted ? Icons.check_circle_outline : Icons.cancel_outlined,
          size: 18,
          color: granted ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}