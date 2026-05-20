import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendanceTable extends StatelessWidget {
  final List<DetailedAttendanceModel> attendance;

  const AttendanceTable({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columnSpacing: 20,
          horizontalMargin: 0,
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Matric No')),
            DataColumn(label: Text('Method')),
            DataColumn(label: Text('Score')),
            DataColumn(label: Text('Mock')),
            DataColumn(label: Text('Time')),
          ],
          rows: attendance.map((item) {
            final time = DateFormat(
              'HH:mm',
            ).format(DateTime.parse(item.markedAt));

            return DataRow(
              cells: [
                DataCell(
                  Text(
                    '${item.firstName} ${item.lastName}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                DataCell(
                  Text(
                    item.matriculationNumber,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item.method.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                DataCell(_ConfidenceBadge(score: item.confidenceScore)),
                DataCell(
                  item.mockLocationDetected
                      ? const Icon(
                          LucideIcons.triangleAlert,
                          color: Colors.red,
                          size: 14,
                        )
                      : const Icon(
                          LucideIcons.circleCheck,
                          color: Colors.green,
                          size: 14,
                        ),
                ),
                DataCell(Text(time, style: const TextStyle(fontSize: 11))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  final double score;
  const _ConfidenceBadge({required this.score});

  @override
  Widget build(BuildContext context) {
    final color = score >= 0.8
        ? Colors.green
        : (score >= 0.5 ? Colors.orange : Colors.red);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        '${(score * 100).toInt()}%',
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
