import 'package:flutter/material.dart';

class CourseErrorState extends StatelessWidget {
  const CourseErrorState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Text(
          'Could not load courses: $message',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.error,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
