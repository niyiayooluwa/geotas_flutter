import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void showCreateCourseDialog(BuildContext context) {
  showShadDialog(context: context, builder: (_) => const CreateCourseDialog());
}

class CreateCourseDialog extends HookConsumerWidget {
  const CreateCourseDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final codeController = useTextEditingController();
    final departmentController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<ShadFormState>());

    Future<void> submit() async {
      if (!formKey.currentState!.saveAndValidate()) return;

      isLoading.value = true;
      try {
        await ref
            .read(courseProvider.notifier)
            .createCourse(
              title: titleController.text.trim(),
              code: codeController.text.trim().toUpperCase(),
              department: departmentController.text.trim(),
            );
        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to create course'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    return ShadDialog(
      title: const Text('Create a course'),
      description: const Text('Fill in the details below.'),
      child: ShadForm(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShadInputFormField(
              id: 'title',
              controller: titleController,
              label: const Text('Course title'),
              placeholder: const Text('Software Engineering'),
              validator: (v) => v.trim().isEmpty ? 'Title is required' : null,
            ),
            const SizedBox(height: 12),
            ShadInputFormField(
              id: 'code',
              controller: codeController,
              label: const Text('Course code'),
              placeholder: const Text('SEN 401'),
              validator: (v) => v.trim().isEmpty ? 'Code is required' : null,
            ),
            const SizedBox(height: 12),
            ShadInputFormField(
              id: 'department',
              controller: departmentController,
              label: const Text('Department'),
              placeholder: const Text('Software Engineering'),
              validator: (v) =>
                  v.trim().isEmpty ? 'Department is required' : null,
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
                    : const Text('Create course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
