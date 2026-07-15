import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StudentAttendanceCard extends StatelessWidget {
  final List<DetailedAttendanceModel> studentRecords;
  final List<int> allWeeks;
  final int? filterWeek;

  const StudentAttendanceCard({
    super.key,
    required this.studentRecords,
    required this.allWeeks,
    this.filterWeek,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    
    final first = studentRecords.first;
    final initials = '${first.firstName[0]}${first.lastName[0]}'.toUpperCase();
    
    final avgScore = studentRecords.fold(0.0, (sum, r) => sum + r.confidenceScore) / studentRecords.length;
    
    Color badgeBg, badgeText, avatarBg, avatarText;
    // For specific status colors (success, warning, destructive) we can use ShadTheme colors
    // Or derive them with opacity for dark mode compatibility.
    // However, Shadcn UI has primary, secondary, destructive.
    if (avgScore >= 0.75) {
      badgeBg = colorScheme.primary.withValues(alpha: 0.1);
      badgeText = colorScheme.primary;
      avatarBg = badgeBg;
      avatarText = badgeText;
    } else if (avgScore >= 0.50) {
      // warning color roughly
      badgeBg = Colors.amber.withValues(alpha: 0.1);
      badgeText = Colors.amber.shade700;
      avatarBg = badgeBg;
      avatarText = Colors.amber.shade900;
    } else {
      badgeBg = colorScheme.destructive.withValues(alpha: 0.1);
      badgeText = colorScheme.destructive;
      avatarBg = badgeBg;
      avatarText = colorScheme.destructive;
    }

    final presentWeeks = studentRecords.map((r) => r.weekNumber).toSet();
    final weeksToDisplay = filterWeek != null ? [filterWeek!] : allWeeks;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: avatarBg,
                child: Text(
                  initials,
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w500,
                    color: avatarText,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${first.firstName} ${first.lastName}',
                      style: theme.textTheme.p.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      first.matriculationNumber,
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  avgScore.toStringAsFixed(2),
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w500,
                    color: badgeText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: weeksToDisplay.map((week) {
              final isPresent = presentWeeks.contains(week);
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isPresent ? colorScheme.primary.withValues(alpha: 0.1) : colorScheme.secondary,
                  borderRadius: BorderRadius.circular(6),
                  border: isPresent 
                      ? null 
                      : Border.all(color: colorScheme.border, width: 0.5, strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Text(
                  'Wk $week',
                  style: theme.textTheme.small.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isPresent ? colorScheme.primary : colorScheme.mutedForeground,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}