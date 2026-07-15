import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendanceFilterChips extends StatelessWidget {
  final List<int> weeks;
  final int? selectedWeek;
  final Function(int?) onWeekSelected;

  const AttendanceFilterChips({
    super.key,
    required this.weeks,
    required this.selectedWeek,
    required this.onWeekSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Row(
        children: [
          _buildChip(context, 'All weeks', null),
          ...weeks.map((w) => _buildChip(context, 'Week $w', w)),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, int? weekValue) {
    final isActive = selectedWeek == weekValue;

    return GestureDetector(
      onTap: () => onWeekSelected(weekValue),
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? ShadTheme.of(context).colorScheme.primary.withValues(alpha: 0.1) : ShadTheme.of(context).colorScheme.muted,
          border: Border.all(
            color: isActive ? ShadTheme.of(context).colorScheme.primary.withValues(alpha: 0.5) : ShadTheme.of(context).colorScheme.border,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? ShadTheme.of(context).colorScheme.primary : ShadTheme.of(context).colorScheme.mutedForeground,
          ),
        ),
      ),
    );
  }
}