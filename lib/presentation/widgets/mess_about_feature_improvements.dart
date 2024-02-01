import 'package:flutter/material.dart';
import 'package:study_ready/utils/app_strings.dart';

void messAboutFeatureImprovements(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        messageAboutDevelopThisThing,
      ),
    ),
  );
}
