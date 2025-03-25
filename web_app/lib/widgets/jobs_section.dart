import 'package:flutter/material.dart';
import '../models/jobs.dart';

class JobsSection extends StatelessWidget {
  const JobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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

        Column(
          children:
              Job.sampleJobs.map((job) {
                return _jobContainer(child: JobItem(job: job));
              }).toList(),
        ),
      ],
    );
  }

  Widget _jobContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 226, 203, 252),
            Color.fromARGB(255, 154, 164, 211),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}

class JobItem extends StatelessWidget {
  final Job job;

  const JobItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "${job.title} - ID: ${job.id}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Status: ${job.status}",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      trailing: Text(
        job.time,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
