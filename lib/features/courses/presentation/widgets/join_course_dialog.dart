import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void showJoinCourseDialog(BuildContext context) {
  showShadDialog(context: context, builder: (_) => const JoinCourseDialog());
}

class JoinCourseDialog extends HookConsumerWidget {
  const JoinCourseDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inviteCodeController = useTextEditingController();
    final matricController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<ShadFormState>());

    Future<void> submit() async {
      if (!formKey.currentState!.saveAndValidate()) return;

      isLoading.value = true;
      try {
        await ref
            .read(courseProvider.notifier)
            .joinCourse(
              inviteCode: inviteCodeController.text.trim(),
              matriculationNumber: matricController.text.trim().toUpperCase(),
            );
        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        if (context.mounted) {
          if (context.mounted) {
            showErrorToast(context, e is Failure ? e : const ServerFailure());
          }
        }
      } finally {
        isLoading.value = false;
      }
    }

    return ShadDialog(
      title: const Text('Join a course'),
      description: const Text(
        'Enter the invite code your lecturer shared with you.',
      ),
      child: ShadForm(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShadInputFormField(
              id: 'invite_code',
              controller: inviteCodeController,
              label: const Text('Invite code'),
              placeholder: const Text('e.g. ABC-12345'),
              validator: (v) =>
                  v.trim().isEmpty ? 'Invite code is required' : null,
            ),
            const SizedBox(height: 12),
            ShadInputFormField(
              id: 'matric',
              controller: matricController,
              label: const Text('Matriculation number'),
              placeholder: const Text('e.g. FUO/22/0001'),
              validator: (v) =>
                  v.trim().isEmpty ? 'Matric number is required' : null,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (_, loading, _) => ShadButton(
                onPressed: loading ? null : submit,
                width: double.infinity,
                child: loading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Join course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
