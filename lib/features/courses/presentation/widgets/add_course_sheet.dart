import 'package:flutter/material.dart';
import 'package:geotas/features/courses/presentation/widgets/create_course_dialog.dart';
import 'package:geotas/features/courses/presentation/widgets/join_course_dialog.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void showAddCourseSheet(BuildContext context) {
  showShadDialog(
    context: context,
    builder: (_) => const AddCourseSheet(),
  );
}

class AddCourseSheet extends StatelessWidget {
  const AddCourseSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: ShadDialog(
        title: const Text('Add a Course'),
        description: const Text(
          'Create or join a course with an invite code',
          textAlign: TextAlign.left,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Create course option
            _SheetOption(
              icon: LucideIcons.circlePlus,
              title: 'Create a course',
              subtitle: 'You will be the lecturer',
              onTap: () {
                Navigator.pop(context);
                showCreateCourseDialog(context);
              },
            ),
            const SizedBox(height: 12),

            // Join course option
            _SheetOption(
              icon: LucideIcons.logIn,
              title: 'Join a course',
              subtitle: 'Enter the course invite code',
              onTap: () {
                Navigator.pop(context);
                showJoinCourseDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetOption extends StatelessWidget {
  const _SheetOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(subtitle, style: ShadTheme.of(context).textTheme.muted),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, size: 18),
          ],
        ),
      ),
    );
  }
}
