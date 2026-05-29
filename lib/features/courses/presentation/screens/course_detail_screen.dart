import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/presentation/widgets/create_session_dialog.dart';
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

        final isLecturer = course.role == 'lecturer';

        return Scaffold(
          appBar: AppBar(
            title: Text(course.code),
            /*actions: [
              if (isLecturer)
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // TODO: Settings
                  },
                ),
            ],*/
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
                  // Course Header Info
                  Text(course.title, style: ShadTheme.of(context).textTheme.h3),
                  const SizedBox(height: 8),

                  Text(
                    course.department,
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                  const SizedBox(height: 16),

                  if (isLecturer) ...[
                    // Invite Code Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Invite Code',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  course.inviteCode,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: course.inviteCode),
                              );
                              ShadToaster.of(context).show(
                                const ShadToast(
                                  title: Text('Invite code copied'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Sessions Section
                  Row(
                    children: [
                      Text(
                        'Sessions',
                        style: ShadTheme.of(context).textTheme.h3,
                      ),
                      const Spacer(),
                      if (isLecturer)
                        ShadButton(
                          onPressed: () =>
                              showCreateSessionDialog(context, courseId),
                          child: const Text('Start Session'),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Session List
                  _SessionList(courseId: courseId, isLecturer: isLecturer),

                  const SizedBox(height: 24),

                  if (isLecturer)
                    ShadButton.destructive(
                      width: double.infinity,
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete Course?'),
                            content: const Text(
                              'This will permanently delete the course and all its sessions and attendance records.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true && context.mounted) {
                          try {
                            await ref
                                .read(courseProvider.notifier)
                                .deleteCourse(courseId);
                            if (context.mounted) context.pop();
                          } catch (e) {
                            if (context.mounted) {
                              showErrorToast(
                                context,
                                e is Failure ? e : const ServerFailure(),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Delete Course'),
                    ),

                  if (!isLecturer)
                    ShadButton.outline(
                      width: double.infinity,
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Leave Course?'),
                            content: const Text(
                              'Your attendance records for this course will be deleted.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                onPressed: () => Navigator.pop(context, true),
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
                                e is Failure ? e : const ServerFailure(),
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
  final bool isLecturer;

  const _SessionList({required this.courseId, required this.isLecturer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(courseSessionsProvider(courseId));

    Future<void> confirmAndDelete(
      BuildContext context,
      WidgetRef ref,
      SessionModel session,
    ) async {
      // 1. Show Confirmation Dialog
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Session?'),
          content: Text(
            'Are you sure you want to delete "${session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title}"? All attendance data will be lost.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );

      // 2. Execute Deletion if Confirmed
      if (confirm == true && context.mounted) {
        try {
          // Call the provider using the session's courseId
          await ref
              .read(courseSessionsProvider(session.courseId).notifier)
              .deleteSession(session.id);

          if (context.mounted) {
            showSuccessToast(context, 'Session deleted successfully.');
          }
        } catch (e) {
          if (context.mounted) {
            showErrorToast(context, e is Failure ? e : const ServerFailure());
          }
        }
      }
    }

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

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 0, // Flat modern look
              clipBehavior: Clip
                  .antiAlias, // Ensures the ripple effect stays inside the rounded corners
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300), // Subtle border
              ),
              child: InkWell(
                onTap: () {
                  if (isLecturer && isActive) {
                    context.push('/sessions/${session.id}/live');
                  } else if (!isLecturer && isActive) {
                    context.push('/sessions/${session.id}/student');
                  }
                },
                // The Padding here is what gives the card its "thickness"
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- TOP ROW: Title & Badge ---
                      Row(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .spaceBetween,
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
                          // Status Badge
                          Row(
                            crossAxisAlignment: .center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? Colors.green.shade50
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: isActive
                                        ? Colors.green.shade200
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  isActive ? 'LIVE' : 'CLOSED',
                                  style: TextStyle(
                                    color: isActive
                                        ? Colors.green.shade700
                                        : Colors.grey.shade600,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),

                              if (isLecturer) ...[
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    size: 20,
                                  ),
                                  color: Colors.red.shade400,
                                  constraints:
                                      const BoxConstraints(), // Removes default bulky padding
                                  padding: EdgeInsets.zero,
                                  onPressed: () =>
                                      confirmAndDelete(context, ref, session),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // --- BOTTOM ROW: Metadata ---
                      Row(
                        children: [
                          // Time Icon & Text
                          Icon(
                            Icons.access_time_rounded,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            // You might want to parse this with DateFormat if it's an ISO string
                            session.startedAt.substring(0, 10),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Radius Icon & Text
                          Icon(
                            Icons.my_location_rounded,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${session.radiusMeters.toInt()}m',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
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
