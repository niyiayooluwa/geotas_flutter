import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const _headings = [
  'Name',
  'Matric No',
  'Week',
  'Method',
  'Score',
  'Mock GPS',
  'Distance (m)',
  'Device',
  'Time',
];

class AttendanceTable extends StatelessWidget {
  final List<DetailedAttendanceModel> attendance;

  const AttendanceTable({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      columnCount: _headings.length,
      rowCount: attendance.length,
      columnSpanExtent: (index) => switch (index) {
        0 => const FixedTableSpanExtent(200), // Name
        1 => const FixedTableSpanExtent(150), // Matric No
        //2 => const FixedTableSpanExtent(130), // Department
        2 => const FixedTableSpanExtent(100), // Week
        3 => const FixedTableSpanExtent(100), // Method
        4 => const FixedTableSpanExtent(80), // Score
        5 => const FixedTableSpanExtent(90), // Mock GPS
        6 => const FixedTableSpanExtent(110), // Distance
        7 => const MaxTableSpanExtent(
          FixedTableSpanExtent(160),
          RemainingTableSpanExtent(),
        ), // Device — fills remaining space
        8 => const FixedTableSpanExtent(70), // Time
        _ => null,
      },
      header: (context, column) {
        return ShadTableCell.header(child: Text(_headings[column]));
      },
      builder: (context, index) {
        final item = attendance[index.row];
        final col = index.column;

        return ShadTableCell(
          child: switch (col) {
            0 => Text(
              '${item.firstName} ${item.lastName}',
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            1 => Text(
              item.matriculationNumber,
              overflow: TextOverflow.ellipsis,
            ),
            //2 => Text(item.department, overflow: TextOverflow.ellipsis),
            2 => ShadBadge.outline(child: Text('Wk ${item.weekNumber}')),
            3 => ShadBadge(child: Text(item.method.toUpperCase())),
            4 => _ConfidenceBadge(score: item.confidenceScore),
            5 => item.mockLocationDetected
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.triangleAlert,
                            color: ShadTheme.of(context).colorScheme.destructive,
                            size: 13,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Yes',
                            style: TextStyle(
                              color: ShadTheme.of(context).colorScheme.destructive,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.circleCheck,
                            color: ShadTheme.of(context).colorScheme.primary, // using primary as success since shadcn doesn't have custom success standard
                            size: 13,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'No',
                            style: TextStyle(
                              color: ShadTheme.of(context).colorScheme.primary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
            6 => Text('${item.distanceFromCenter.toStringAsFixed(1)}m'),
            7 => Text(
              '${item.deviceModel} · ${item.osVersion}',
              overflow: TextOverflow.ellipsis,
            ),
            8 => Text(
              DateFormat('HH:mm').format(DateTime.parse(item.markedAt)),
            ),
            _ => const SizedBox.shrink(),
          },
        );
      },
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  final double score;

  const _ConfidenceBadge({required this.score});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    
    final (bg, border, fg) = score >= 0.8
        ? (
            colorScheme.primary.withValues(alpha: 0.1),
            colorScheme.primary.withValues(alpha: 0.3),
            colorScheme.primary,
          )
        : score >= 0.5
        ? (
            Colors.amber.withValues(alpha: 0.1),
            Colors.amber.withValues(alpha: 0.3),
            Colors.amber.shade700,
          )
        : (
            colorScheme.destructive.withValues(alpha: 0.1),
            colorScheme.destructive.withValues(alpha: 0.3),
            colorScheme.destructive,
          );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: border),
      ),
      child: Text(
        '${(score * 100).toInt()}%',
        style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}
