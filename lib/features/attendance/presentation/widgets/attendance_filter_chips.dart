import 'package:flutter/material.dart';

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
          _buildChip('All weeks', null),
          ...weeks.map((w) => _buildChip('Week $w', w)),
        ],
      ),
    );
  }

  Widget _buildChip(String label, int? weekValue) {
    final isActive = selectedWeek == weekValue;

    return GestureDetector(
      onTap: () => onWeekSelected(weekValue),
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFE1F5EE) : Colors.grey.shade100,
          border: Border.all(
            color: isActive ? const Color(0xFF5DCAA5) : Colors.grey.shade300,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFF085041) : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}