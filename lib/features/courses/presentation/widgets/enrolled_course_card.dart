import 'package:flutter/material.dart';
import 'package:geotas/core/utils/colors.dart';
import 'package:geotas/features/courses/data/models/course_responses.dart';

class EnrolledCourseCard extends StatelessWidget {
  const EnrolledCourseCard({super.key, required this.course, this.onTap});

  final EnrolledCourse course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isLecturer = course.role == 'lecturer';
    final accent = colourForCode(course.code);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isLecturer
                    ? theme.colorScheme.secondaryContainer
                    : theme.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isLecturer ? 'Lecturer' : 'Student',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: isLecturer
                      ? theme.colorScheme.onSecondaryContainer
                      : theme.colorScheme.onTertiaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Course code
            Text(
              course.code,
              style: TextStyle(
                fontSize: 11,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 2),

            // Course title
            Text(
              course.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Department meta
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    course.department,
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
