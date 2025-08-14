import 'package:flutter/material.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with real data source

    final List<Map<String, String>> completedReports = [
      {
        'title': 'Monthly Progress Report',
        'date': '2025-08-01',
        'summary': 'Summary of monthly progress and achievements.'
      },
      {
        'title': 'Annual Review',
        'date': '2025-07-15',
        'summary': 'Comprehensive review of the year.'
      },
    ];

    // Sort reports by date descending (most recent first)
    completedReports.sort((a, b) => (b['date'] ?? '').compareTo(a['date'] ?? ''));

    return LayoutBuilder(
      builder: (context, constraints) {
        final double horizontalPadding = constraints.maxWidth < 500 ? 8 : 32;
        final double verticalPadding = constraints.maxWidth < 500 ? 8 : 16;
        if (completedReports.isEmpty) {
          return const Center(
            child: Text(
              'No completed reports yet.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          itemCount: completedReports.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final report = completedReports[index];
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(report['title'] ?? ''),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${report['date'] ?? ''}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(report['summary'] ?? ''),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file, color: Colors.blueAccent),
                title: Text(report['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${report['date'] ?? ''}\n${report['summary'] ?? ''}', maxLines: 2, overflow: TextOverflow.ellipsis),
                isThreeLine: true,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.blue.withOpacity(0.05),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            );
          },
        );
      },
    );
  }
}
