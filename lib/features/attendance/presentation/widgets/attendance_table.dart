import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const _headings = [
  'Name',
  'Matric No',
  'Department',
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
        0 => const FixedTableSpanExtent(160), // Name
        1 => const FixedTableSpanExtent(120), // Matric No
        2 => const FixedTableSpanExtent(130), // Department
        3 => const FixedTableSpanExtent(100), // Week
        4 => const FixedTableSpanExtent(100), // Method
        5 => const FixedTableSpanExtent(80), // Score
        6 => const FixedTableSpanExtent(90), // Mock GPS
        7 => const FixedTableSpanExtent(110), // Distance
        8 => const MaxTableSpanExtent(
          FixedTableSpanExtent(160),
          RemainingTableSpanExtent(),
        ), // Device — fills remaining space
        9 => const FixedTableSpanExtent(70), // Time
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
            2 => Text(item.department, overflow: TextOverflow.ellipsis),
            3 => ShadBadge.outline(child: Text('Wk ${item.weekNumber}')),
            4 => ShadBadge(child: Text(item.method.toUpperCase())),
            5 => _ConfidenceBadge(score: item.confidenceScore),
            6 =>
              item.mockLocationDetected
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.triangleAlert,
                          color: Color(0xFFef4444),
                          size: 13,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Yes',
                          style: TextStyle(
                            color: Color(0xFFef4444),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.circleCheck,
                          color: Color(0xFF22c55e),
                          size: 13,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'No',
                          style: TextStyle(
                            color: Color(0xFF22c55e),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
            7 => Text('${item.distanceFromCenter.toStringAsFixed(1)}m'),
            8 => Text(
              '${item.deviceModel} · ${item.osVersion}',
              overflow: TextOverflow.ellipsis,
            ),
            9 => Text(
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
    final (bg, border, fg) = score >= 0.8
        ? (
            const Color(0xFFdcfce7),
            const Color(0xFF86efac),
            const Color(0xFF16a34a),
          )
        : score >= 0.5
        ? (
            const Color(0xFFfef9c3),
            const Color(0xFFfde047),
            const Color(0xFFca8a04),
          )
        : (
            const Color(0xFFfee2e2),
            const Color(0xFFfca5a5),
            const Color(0xFFdc2626),
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
