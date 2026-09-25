import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../widgets/activity_card.dart';

class ActivityListScreen extends StatelessWidget {
  const ActivityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivityProvider>(context);
    final categories = ['Semua', 'Tugas', 'Kuis', 'Proyek', 'Ujian'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Aktivitas Belajar'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => provider.setSearchQuery(val),
              decoration: InputDecoration(
                hintText: 'Cari tugas atau mata kuliah...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((cat) {
                  final isSelected = provider.selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: Colors.deepPurple,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                      onSelected: (_) => provider.setSelectedCategory(cat),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: provider.filteredActivities.isEmpty
                  ? const Center(child: Text('Tidak ada aktivitas ditemukan.'))
                  : ListView.builder(
                      itemCount: provider.filteredActivities.length,
                      itemBuilder: (ctx, i) => ActivityCard(activity: provider.filteredActivities[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}