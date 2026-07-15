import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendanceMetricsRow extends StatelessWidget {
  final List<DetailedAttendanceModel> records;

  const AttendanceMetricsRow({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    
    final uniqueStudents = records.map((r) => r.userId).toSet().length;
    final uniqueSessions = records.map((r) => r.weekNumber).toSet().length;
    
    double avgScore = 0.0;
    if (records.isNotEmpty) {
      avgScore = records.fold(0.0, (sum, r) => sum + r.confidenceScore) / records.length;
    }

    Color scoreColor = colorScheme.primary;
    if (avgScore < 0.5) {
      scoreColor = colorScheme.destructive;
    } else if (avgScore < 0.75) {
      scoreColor = Colors.amber.shade700;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(child: _buildMetricCard(context, 'Students', uniqueStudents.toString())),
          const SizedBox(width: 8),
          Expanded(child: _buildMetricCard(context, 'Sessions', uniqueSessions.toString())),
          const SizedBox(width: 8),
          Expanded(
            child: _buildMetricCard(
              context,
              'Avg. score',
              avgScore.toStringAsFixed(2),
              valueColor: scoreColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, String label, String value, {Color? valueColor}) {
    final theme = ShadTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.small.copyWith(color: theme.colorScheme.mutedForeground, fontSize: 11),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.large.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: valueColor ?? theme.colorScheme.foreground,
            ),
          ),
        ],
      ),
    );
  }
}