import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/auth/providers/lecturer_auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LecturerRegisterScreen extends HookConsumerWidget {
  const LecturerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final departmentController = useTextEditingController();

    ref.listen(lecturerAuthProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          showErrorToast(
            context,
            error is Failure ? error : ServerFailure(error.toString()),
          );
        },
      );
    });

    final authState = ref.watch(lecturerAuthProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Lecturer Registration')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShadInputFormField(
                    label: const Text('First Name'),
                    controller: firstNameController,
                    placeholder: const Text('First Name'),
                    validator: (v) => v.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    label: const Text('Last Name'),
                    controller: lastNameController,
                    placeholder: const Text('Last Name'),
                    validator: (v) => v.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    label: const Text('Email'),
                    controller: emailController,
                    placeholder: const Text('Enter your email'),
                    validator: (v) {
                      if (v.isEmpty) return 'Email cannot be empty';
                      if (!v.contains('@')) return 'Enter a valid email address';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    label: const Text('Password'),
                    controller: passwordController,
                    placeholder: const Text('Enter your password'),
                    obscureText: true,
                    validator: (v) {
                      if (v.isEmpty) return 'Password cannot be empty';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    label: const Text('Department'),
                    controller: departmentController,
                    placeholder: const Text('e.g. Computer Science'),
                    validator: (v) => v.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 24),
                  ShadButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (formKey.currentState!.validate()) {
                              await ref
                                  .read(lecturerAuthProvider.notifier)
                                  .register(
                                    firstName: firstNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    department: departmentController.text.trim(),
                                  );
                              
                              if (!ref.read(lecturerAuthProvider).hasError) {
                                if (context.mounted) {
                                  context.go('/lecturer/home');
                                }
                              }
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Register'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.go('/lecturer/login'),
                    child: const Text('Already have an account? Login here'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
