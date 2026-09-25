import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<ActivityProvider>(context);

    final activity = provider.activities.firstWhere(
      (a) => a.id == activityId,
      orElse: () => provider.activities.first,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Aktivitas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/form', arguments: activity.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text(activity.category), backgroundColor: Colors.deepPurple.shade100),
                Text('ID: ${activity.id}', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Text(activity.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Mata Kuliah: ${activity.course}', style: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
            Text('Tenggat Waktu: ${activity.dueDate.toString().split(' ')[0]}', style: const TextStyle(color: Colors.grey)),
            const Divider(height: 32),
            const Text('Deskripsi Tugas:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(activity.description, style: const TextStyle(fontSize: 14, height: 1.4)),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: activity.isCompleted ? Colors.grey : Colors.green,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () => provider.toggleCompleted(activity.id),
              icon: Icon(activity.isCompleted ? Icons.undo : Icons.check_circle, color: Colors.white),
              label: Text(activity.isCompleted ? 'Tandai Belum Selesai' : 'Tandai Selesai',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}