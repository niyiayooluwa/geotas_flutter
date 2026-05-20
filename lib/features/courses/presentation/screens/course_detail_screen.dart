import 'package:flutter/material.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/presentation/widgets/create_session_dialog.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
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
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
      data: (courses) {
        final course = courses.firstWhere(
          (c) => c.id == courseId,
          orElse: () => throw 'Course not found',
        );

        final isLecturer = course.role == 'lecturer';

        return Scaffold(
          appBar: AppBar(
            title: Text(course.code),
            actions: [
              if (isLecturer)
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // TODO: Settings
                  },
                ),
            ],
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
                  Text(course.title, style: ShadTheme.of(context).textTheme.h2),
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
                              // TODO: Copy to clipboard
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

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text('Error loading sessions: $err')),
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
              child: ListTile(
                title: Text(
                  session.title.isEmpty
                      ? 'Week ${session.weekNumber}'
                      : session.title,
                ),
                subtitle: Text('Status: ${session.status.toUpperCase()}'),
                trailing: isActive
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'LIVE',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Navigate to session details or marking screen
                },
              ),
            );
          },
        );
      },
    );
  }
}
