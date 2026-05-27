import 'package:flutter/material.dart';
import 'package:geotas/core/utils/date_formatter.dart';
import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:geotas/features/courses/presentation/widgets/add_course_sheet.dart';
import 'package:geotas/features/courses/presentation/widgets/course_list.dart';
import 'package:geotas/features/courses/presentation/widgets/user_avatar.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MobileDashboardView extends HookConsumerWidget {
  const MobileDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final user = userAsync.when(
      data: (u) => u,
      loading: () => null,
      error: (_, _) => null,
    );

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => ref.read(courseProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MobileHeader(user: user),
              const SizedBox(height: 24),
              const _MobileContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  final UserModel? user;
  const _MobileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good ${greeting()}, ${user?.firstName ?? ''}',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: 2),
              Text(
                formattedDate(),
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ),
        ClipOval(
          child: Image.network(
            user?.avatarUrl ?? '',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => UserAvatar(user: user),
          ),
        ),
      ],
    );
  }
}

class _MobileContent extends StatelessWidget {
  const _MobileContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Enrolled courses',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => showAddCourseSheet(context),
              child: Text(
                '+ Add course',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const CourseList(),
      ],
    );
  }
}
