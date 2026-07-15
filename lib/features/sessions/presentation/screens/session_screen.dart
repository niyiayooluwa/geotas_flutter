import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class SessionScreen extends ConsumerWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(allLecturerSessionsProvider);
    final coursesAsync = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sessions')),
      body: sessionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(
          message: err is Failure ? err.message : 'Something went wrong.',
        ),
        data: (sessions) {
          if (sessions.isEmpty) {
            return const Center(child: Text('No sessions found.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: sessions.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final session = sessions[index];
              final course = coursesAsync.value?.firstWhere(
                (c) => c.id == session.courseId,
              );

              return _SessionListItem(
                session: session,
                courseCode: course?.code ?? '???',
              );
            },
          );
        },
      ),
    );
  }
}

class _SessionListItem extends StatelessWidget {
  final SessionModel session; // Upgraded from dynamic to SessionModel
  final String courseCode;

  const _SessionListItem({required this.session, required this.courseCode});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    
    final isActive = session.status == 'active';
    final date = DateFormat(
      'MMM dd, yyyy',
    ).format(DateTime.parse(session.startedAt));

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.border),
      ),
      child: InkWell(
        onTap: () {
          if (isActive) {
            context.push('/sessions/${session.id}/live');
          } else {
            final title = session.title.isEmpty
                ? 'Week ${session.weekNumber}'
                : session.title;
            context.push('/sessions/${session.id}/attendance?title=$title');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- TOP ROW: Title & Badge ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.title.isEmpty
                          ? 'Week ${session.weekNumber}'
                          : session.title,
                      style: theme.textTheme.large,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Modern Status Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? colorScheme.primary.withValues(alpha: 0.1)
                          : colorScheme.secondary,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isActive
                            ? colorScheme.primary.withValues(alpha: 0.3)
                            : colorScheme.border,
                      ),
                    ),
                    child: Text(
                      isActive ? 'LIVE' : 'CLOSED',
                      style: theme.textTheme.small.copyWith(
                        color: isActive
                            ? colorScheme.primary
                            : colorScheme.mutedForeground,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // --- BOTTOM ROW: Course, Date, & Radius ---
              Row(
                children: [
                  // Course Code
                  Icon(
                    Icons.book_rounded,
                    size: 15,
                    color: colorScheme.mutedForeground,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    courseCode,
                    style: theme.textTheme.small.copyWith(
                      color: colorScheme.mutedForeground,
                      fontWeight:
                          FontWeight.w600, // Slightly bolder to stand out
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Date
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: colorScheme.mutedForeground,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: theme.textTheme.small.copyWith(
                      color: colorScheme.mutedForeground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(
                    width: 14,
                  ), // Pushes the radius to the far right
                  // Radius
                  Icon(
                    Icons.my_location_rounded,
                    size: 15,
                    color: colorScheme.mutedForeground,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${session.radiusMeters.toInt()}m',
                    style: theme.textTheme.small.copyWith(
                      color: colorScheme.mutedForeground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
