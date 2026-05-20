import 'package:flutter/material.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_card.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_sheet.dart';
import 'package:geotas/features/courses/presentation/widgets/course_empty_state.dart';
import 'package:geotas/features/courses/presentation/widgets/course_error_state.dart';
import 'package:geotas/features/courses/presentation/widgets/enrolled_course_card.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseGrid extends ConsumerWidget {
  const CourseGrid({super.key, required this.isDesktop});

  final bool isDesktop;

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

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemCount: courses.length + 1,
          itemBuilder: (context, i) {
            if (i == courses.length) {
              return AddCourseCard(onTap: () => showAddCourseSheet(context));
            }
            final course = courses[i];
            return EnrolledCourseCard(
              course: course,
              onTap: () => context.push('/courses/${course.id}'),
            );
          },
        );
      },
    );
  }
}
