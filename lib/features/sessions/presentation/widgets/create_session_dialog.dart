import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void showCreateSessionDialog(BuildContext context, String courseId) {
  showShadDialog(
    context: context,
    builder: (_) => CreateSessionDialog(courseId: courseId),
  );
}

class CreateSessionDialog extends HookConsumerWidget {
  final String courseId;

  const CreateSessionDialog({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final weekController = useTextEditingController(text: '1');
    final radiusController = useTextEditingController(text: '50');
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<ShadFormState>());

    Future<Position> determinePosition() async {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw 'Location services are disabled.';
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
        ),
      );
    }

    Future<void> submit() async {
      if (!formKey.currentState!.saveAndValidate()) return;

      isLoading.value = true;
      try {
        final position = await determinePosition();

        await ref
            .read(courseSessionsProvider(courseId).notifier)
            .createSession(
              CreateSessionRequest(
                courseId: courseId,
                title: titleController.text.trim(),
                weekNumber: int.parse(weekController.text),
                latitude: position.latitude,
                longitude: position.longitude,
                radiusMeters: double.parse(radiusController.text),
              ),
            );

        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to start session'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    return ShadDialog(
      title: const Text('Start Attendance Session'),
      description: const Text(
        'This will use your current location as the geofence center.',
        textAlign: TextAlign.left,
      ),
      child: ShadForm(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShadInputFormField(
              id: 'title',
              controller: titleController,
              label: const Text('Session Title (Optional)'),
              placeholder: const Text('Monday Lecture'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ShadInputFormField(
                    id: 'week',
                    controller: weekController,
                    label: const Text('Week Number'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v.trim().isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ShadInputFormField(
                    id: 'radius',
                    controller: radiusController,
                    label: const Text('Radius (meters)'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v.trim().isEmpty ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (_, loading, _) => ShadButton(
                onPressed: loading ? null : submit,
                width: double.infinity,
                child: loading
                    ? SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ShadTheme.of(context).colorScheme.primaryForeground,
                        ),
                      )
                    : const Text('Start Session'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
