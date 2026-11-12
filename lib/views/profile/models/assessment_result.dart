import 'package:flutter/material.dart';

class AssessmentResult {
  final String name;
  final double score;
  final String description;
  final IconData icon;

  const AssessmentResult({
    required this.name,
    required this.score,
    required this.description,
    required this.icon,
  });
}
