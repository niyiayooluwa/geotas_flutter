import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';

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
    final first = studentRecords.first;
    final initials = '${first.firstName[0]}${first.lastName[0]}'.toUpperCase();
    
    final avgScore = studentRecords.fold(0.0, (sum, r) => sum + r.confidenceScore) / studentRecords.length;
    
    Color badgeBg, badgeText, avatarBg, avatarText;
    if (avgScore >= 0.75) {
      badgeBg = const Color(0xFFE1F5EE);
      badgeText = const Color(0xFF085041);
      avatarBg = badgeBg;
      avatarText = badgeText;
    } else if (avgScore >= 0.50) {
      badgeBg = const Color(0xFFFAEEDA);
      badgeText = const Color(0xFF854F0B);
      avatarBg = badgeBg;
      avatarText = const Color(0xFF633806);
    } else {
      badgeBg = const Color(0xFFFCEBEB);
      badgeText = const Color(0xFFA32D2D);
      avatarBg = badgeBg;
      avatarText = const Color(0xFF791F1F);
    }

    final presentWeeks = studentRecords.map((r) => r.weekNumber).toSet();
    final weeksToDisplay = filterWeek != null ? [filterWeek!] : allWeeks;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
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
                  style: TextStyle(
                    fontSize: 12,
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
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      first.matriculationNumber,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
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
                  style: TextStyle(
                    fontSize: 12,
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
                  color: isPresent ? const Color(0xFFE1F5EE) : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: isPresent 
                      ? null 
                      : Border.all(color: Colors.grey.shade300, width: 0.5, strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Text(
                  'Wk $week',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isPresent ? const Color(0xFF085041) : Colors.grey.shade500,
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