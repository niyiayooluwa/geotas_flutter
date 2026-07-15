import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:geotas/features/courses/presentation/widgets/user_avatar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(
          message: err is Failure ? err.message : 'Something went wrong.',
          onRetry: () => ref.invalidate(userProvider),
        ),
        data: (user) {
          if (user == null) {
            return const Center(child: Text('No user data found'));
          }

          final createdDate = DateTime.parse(user.createdAt);
          final formattedDate = DateFormat('MMMM dd, yyyy').format(createdDate);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                Center(
                  child: ClipOval(
                    child: Image.network(
                      user.avatarUrl ?? '',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) =>
                          UserAvatar(user: user, size: 100),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  '${user.firstName} ${user.lastName}',
                  style: ShadTheme.of(context).textTheme.h2,
                ),

                Text(user.email, style: ShadTheme.of(context).textTheme.muted),
                const SizedBox(height: 32),

                _ProfileInfoCard(
                  label: 'Account Created',
                  value: formattedDate,
                  icon: LucideIcons.calendar,
                ),
                const SizedBox(height: 40),

                ShadButton.destructive(
                  width: double.infinity,
                  onPressed: () async {
                    await ref.read(secureStorageProvider).deleteToken();
                    await ref.read(secureStorageProvider).deleteRole();
                    ref.read(userProvider.notifier).clear();
                    if (context.mounted) context.go('/login');
                  },
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  const _ProfileInfoCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
