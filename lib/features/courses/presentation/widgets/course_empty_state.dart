import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CourseEmptyState extends StatelessWidget {
  const CourseEmptyState({super.key, required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            Icon(
              Icons.book_outlined,
              size: 40,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 12),
            Text(
              'No courses yet',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Create or join a course to get started.',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
            const SizedBox(height: 20),
            ShadButton(onPressed: onAdd, child: const Text('Add a course')),
          ],
        ),
      ),
    );
  }
}
