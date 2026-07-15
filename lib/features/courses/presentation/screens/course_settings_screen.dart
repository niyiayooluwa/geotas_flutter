import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CourseSettingsScreen extends HookConsumerWidget {
  final String courseId;

  const CourseSettingsScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);
    final isSaving = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Settings'),
      ),
      body: coursesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (courses) {
          final course = courses.firstWhere(
            (c) => c.id == courseId,
            orElse: () => throw 'Course not found',
          );

          // Hook must be inside data builder or outside?
          // Actually, we shouldn't put hooks conditionally, so it's better to isolate the content.
          return _CourseSettingsContent(
            courseId: courseId,
            initialThreshold: course.confidenceThreshold,
            isSaving: isSaving,
          );
        },
      ),
    );
  }
}

class _CourseSettingsContent extends HookConsumerWidget {
  final String courseId;
  final double initialThreshold;
  final ValueNotifier<bool> isSaving;

  const _CourseSettingsContent({
    required this.courseId,
    required this.initialThreshold,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = useState<double>(initialThreshold);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attendance Confidence Threshold',
            style: ShadTheme.of(context).textTheme.h4,
          ),
          const SizedBox(height: 8),
          Text(
            'Set the minimum confidence required for a facial recognition scan to be accepted as a valid attendance log. A higher value reduces false positives but may require clearer photos.',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: ShadTheme.of(context).colorScheme.primary,
                    inactiveTrackColor: ShadTheme.of(context).colorScheme.secondary,
                    thumbColor: ShadTheme.of(context).colorScheme.primary,
                    overlayColor: ShadTheme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    valueIndicatorColor: ShadTheme.of(context).colorScheme.primary,
                    valueIndicatorTextStyle: TextStyle(color: ShadTheme.of(context).colorScheme.primaryForeground),
                  ),
                  child: Slider(
                    value: sliderValue.value,
                    min: 0,
                    max: 1,
                    divisions: 20,
                    label: '${(sliderValue.value * 100).toInt()}%',
                    onChanged: (val) => sliderValue.value = val,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 64,
                child: Text(
                  '${(sliderValue.value * 100).toInt()}%',
                  style: ShadTheme.of(context).textTheme.large.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const Spacer(),
          ShadButton(
            width: double.infinity,
            onPressed: isSaving.value
                ? null
                : () async {
                    isSaving.value = true;
                    try {
                      await ref
                          .read(courseProvider.notifier)
                          .updateCourseSettings(courseId, sliderValue.value);
                      if (context.mounted) {
                        showSuccessToast(context, 'Settings updated successfully');
                      }
                    } catch (e) {
                      if (context.mounted) {
                        showErrorToast(context, ServerFailure(e.toString()));
                      }
                    } finally {
                      isSaving.value = false;
                    }
                  },
            child: isSaving.value
                ? SizedBox(
                    width: 32,
                    height: 16,
                    child: SpinKitThreeBounce(
                      color: ShadTheme.of(context).colorScheme.primaryForeground,
                      size: 16,
                    ),
                  )
                : const Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}
