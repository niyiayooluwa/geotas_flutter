import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';

class AttendanceMetricsRow extends StatelessWidget {
  final List<DetailedAttendanceModel> records;

  const AttendanceMetricsRow({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    final uniqueStudents = records.map((r) => r.userId).toSet().length;
    final uniqueSessions = records.map((r) => r.weekNumber).toSet().length;
    
    double avgScore = 0.0;
    if (records.isNotEmpty) {
      avgScore = records.fold(0.0, (sum, r) => sum + r.confidenceScore) / records.length;
    }

    Color scoreColor = const Color(0xFF0F6E56);
    if (avgScore < 0.5) {
      scoreColor = const Color(0xFFA32D2D);
    } else if (avgScore < 0.75) {
      scoreColor = const Color(0xFF854F0B);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(child: _buildMetricCard('Students', uniqueStudents.toString())),
          const SizedBox(width: 8),
          Expanded(child: _buildMetricCard('Sessions', uniqueSessions.toString())),
          const SizedBox(width: 8),
          Expanded(
            child: _buildMetricCard(
              'Avg. score',
              avgScore.toStringAsFixed(2),
              valueColor: scoreColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, {Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}