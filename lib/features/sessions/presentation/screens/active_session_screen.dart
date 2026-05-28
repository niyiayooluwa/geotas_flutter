import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/features/sessions/presentation/widgets/active_session_content.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveSessionScreen extends HookConsumerWidget {
  final String sessionId;

  const ActiveSessionScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionDetailsProvider(sessionId));

    return Scaffold(
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(
          message: err is Failure ? err.message : 'Something went wrong.',
          onRetry: () => ref.invalidate(sessionDetailsProvider(sessionId)),
        ),
        data: (session) {
          if (session == null) {
            return const Center(child: Text('Session not found'));
          }
          if (session.status != 'active') {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) Navigator.pop(context);
            });
            return const Center(child: Text('Session closed.'));
          }
          return ActiveSessionContent(session: session);
        },
      ),
    );
  }
}