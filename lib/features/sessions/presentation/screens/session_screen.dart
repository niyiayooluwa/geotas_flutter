import 'package:flutter/material.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
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
        error: (err, _) => Center(child: Text('Error: $err')),
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
              final course = coursesAsync.value?.firstWhere((c) => c.id == session.courseId);
              
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
  final dynamic session;
  final String courseCode;

  const _SessionListItem({required this.session, required this.courseCode});

  @override
  Widget build(BuildContext context) {
    final isActive = session.status == 'active';
    final date = DateFormat('MMM dd, yyyy').format(DateTime.parse(session.startedAt));

    return Card(
      child: ListTile(
        title: Text(
          session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$courseCode • $date'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            isActive ? 'LIVE' : 'CLOSED',
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey.shade700,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          if (isActive) {
            context.push('/sessions/${session.id}/live');
          } else {
            final title =
                session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title;
            context.push('/sessions/${session.id}/attendance?title=$title');
          }
        },
      ),
    );
  }
}
