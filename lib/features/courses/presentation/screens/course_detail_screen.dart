import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CourseDetailScreen extends HookConsumerWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);

    return coursesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => ErrorView(
        message: err is Failure ? err.message : 'Something went wrong.',
        onRetry: () => ref.invalidate(courseProvider),
      ),
      data: (courses) {
        final course = courses.firstWhere(
          (c) => c.id == courseId,
          orElse: () => throw 'Course not found',
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(course.code),
          ),
          body: RefreshIndicator(
            onRefresh: () =>
                ref.read(courseSessionsProvider(courseId).notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title, style: ShadTheme.of(context).textTheme.h3),
                  const SizedBox(height: 8),

                  Text(
                    course.department,
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'Sessions',
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                  const SizedBox(height: 16),
                  _SessionList(courseId: courseId),

                  const SizedBox(height: 24),

                  ShadButton.outline(
                    width: double.infinity,
                    onPressed: () async {
                      final confirm = await showShadDialog<bool>(
                        context: context,
                        builder: (dialogContext) => ShadDialog.alert(
                          title: const Text('Leave Course?'),
                          description: const Text(
                            'Your attendance records for this course will be deleted.',
                          ),
                          actions: [
                            ShadButton.outline(
                              onPressed: () =>
                                  Navigator.of(dialogContext).pop(false),
                              child: const Text('Cancel'),
                            ),
                            ShadButton.destructive(
                              onPressed: () =>
                                  Navigator.of(dialogContext).pop(true),
                              child: const Text('Leave'),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true && context.mounted) {
                        try {
                          await ref
                              .read(courseProvider.notifier)
                              .leaveCourse(courseId);
                          if (context.mounted) context.pop();
                        } catch (e) {
                          if (context.mounted) {
                            showErrorToast(
                              context,
                              e is Failure
                                  ? e
                                  : const ServerFailure(
                                      'Failed to leave course',
                                    ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text('Leave Course'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SessionList extends ConsumerWidget {
  final String courseId;

  const _SessionList({required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(courseSessionsProvider(courseId));

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => ErrorView(
        message: err is Failure ? err.message : 'Something went wrong.',
        onRetry: () => ref.invalidate(courseSessionsProvider(courseId)),
      ),
      data: (sessions) {
        if (sessions.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'No sessions yet',
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            final isActive = session.status == 'active';
            final theme = ShadTheme.of(context);

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: ShadTheme.of(context).colorScheme.border),
              ),
              child: InkWell(
                onTap: () {
                  if (isActive) {
                    context.push('/sessions/${session.id}/student');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              session.title.isEmpty
                                  ? 'Week ${session.weekNumber}'
                                  : session.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                                      : theme.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: isActive
                                        ? theme.colorScheme.primary.withValues(alpha: 0.3)
                                        : theme.colorScheme.border,
                                  ),
                                ),
                                child: Text(
                                  isActive ? 'LIVE' : 'CLOSED',
                                  style: TextStyle(
                                    color: isActive
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.mutedForeground,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 16,
                            color: theme.colorScheme.mutedForeground,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            session.startedAt.substring(0, 10),
                            style: theme.textTheme.muted.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.my_location_rounded,
                            size: 16,
                            color: theme.colorScheme.mutedForeground,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${session.radiusMeters.toInt()}m',
                            style: theme.textTheme.muted.copyWith(
                              fontSize: 13,
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
          },
        );
      },
    );
  }
}
