class Job {
  final String title;
  final String status;
  final String time;
  final String id;

  Job({
    required this.title,
    required this.status,
    required this.time,
    required this.id,
  });

  // Example list of jobs
  static List<Job> sampleJobs = [
    Job(title: "Job A", status: "Completed", time: "10:00 AM", id: "1"),
    Job(title: "Job B", status: "Pending", time: "12:30 PM", id: "2"),
    Job(title: "Job C", status: "In Progress", time: "02:15 PM", id: "3"),
  ];
}
