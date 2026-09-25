import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../widgets/activity_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivityProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas Favorit / Prioritas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: provider.favoriteActivities.isEmpty
          ? const Center(child: Text('Belum ada aktivitas yang ditandai favorit.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.favoriteActivities.length,
              itemBuilder: (ctx, i) => ActivityCard(activity: provider.favoriteActivities[i]),
            ),
    );
  }
}