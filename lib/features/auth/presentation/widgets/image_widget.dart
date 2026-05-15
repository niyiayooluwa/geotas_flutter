import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthImagePanel extends StatelessWidget {
  const AuthImagePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset('assets/image/auth.jpg', fit: BoxFit.cover),

        // Dark gradient overlay — heavier at bottom for text readability
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.1),
                Colors.black.withValues(alpha: 0.75),
              ],
            ),
          ),
        ),

        // Copy pinned to bottom left
        Positioned(
          bottom: 48,
          left: 40,
          right: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Attendance,\naccounted for.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'GEOTAS uses location and QR technology to make sure every present student is actually present.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 20,
          left: 40,
          height: 40,
          child: SvgPicture.asset(
            'assets/svgs/logo-white.svg',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
