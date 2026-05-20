import 'package:flutter/material.dart';
import 'package:geotas/core/utils/colors.dart';
import 'package:geotas/features/courses/data/models/course_responses.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_sheet.dart';
import 'package:geotas/features/courses/presentation/widgets/course_empty_state.dart';
import 'package:geotas/features/courses/presentation/widgets/course_error_state.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CourseList extends ConsumerWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);

    return coursesAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(48),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, _) => CourseErrorState(message: e.toString()),
      data: (courses) {
        if (courses.isEmpty) {
          return CourseEmptyState(onAdd: () => showAddCourseSheet(context));
        }

        return Column(
          children: courses.map((course) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MobileCourseRow(course: course),
            );
          }).toList(),
        );
      },
    );
  }
}

class MobileCourseRow extends StatelessWidget {
  const MobileCourseRow({super.key, required this.course});

  final EnrolledCourse course;

  @override
  Widget build(BuildContext context) {
    final accent = colourForCode(course.code);

    return GestureDetector(
      onTap: () => context.push('/courses/${course.id}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: ShadTheme.of(context).colorScheme.border,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.code,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    course.role == 'lecturer' ? 'Lecturer' : 'Student',
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.chevron_right,
              size: 16,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}
