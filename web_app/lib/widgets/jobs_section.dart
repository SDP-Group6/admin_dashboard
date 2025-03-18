import 'package:flutter/material.dart';
import '../models/jobs.dart';

class JobsSection extends StatelessWidget {
  const JobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme properties

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Scheduled Jobs",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: theme.cardTheme.color, // Use themed card background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: 2,
            ), // Apply black border
            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Column(
            children:
                Job.sampleJobs.map((job) {
                  return Column(
                    children: [
                      JobItem(job: job, borderColor: borderColor),
                      if (job != Job.sampleJobs.last) const Divider(),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class JobItem extends StatelessWidget {
  final Job job;
  final Color borderColor;

  const JobItem({super.key, required this.job, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme

    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color, // Use themed card background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2), // Apply black border
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text(
          "${job.title} - ID: ${job.id}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Status: ${job.status}"),
        trailing: Text(
          job.time,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
