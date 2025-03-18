import 'package:flutter/material.dart';
import '../widgets/jobs_section.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: JobsSection(), // Uses JobsSection
    );
  }
}
