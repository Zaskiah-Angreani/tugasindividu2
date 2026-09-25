import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class ActivityProvider with ChangeNotifier {
  // Tanggal diatur tetap di bulan Desember 2026 agar 10 data tidak tersembunyi
  final List<ActivityModel> _activities = [
    ActivityModel(
      id: 'IK-1',
      title: 'Implementasi State Management Provider',
      description: 'Membuat pengelolaan state dinamis dan named routing pada aplikasi Flutter.',
      course: 'Pemrograman Mobile',
      dueDate: DateTime(2026, 12, 20),
      category: 'Tugas',
      isCompleted: true,
      isFavorite: true,
    ),
    ActivityModel(
      id: 'IK-2',
      title: 'Penyusunan Draft Proposal Metopen',
      description: 'Menyusun Bab 1 Latar Belakang dan Rumusan Masalah untuk penelitian tugas akhir.',
      course: 'Metodologi Penelitian',
      dueDate: DateTime(2026, 12, 21),
      category: 'Proyek',
      isCompleted: false,
      isFavorite: true,
    ),
    ActivityModel(
      id: 'IK-3',
      title: 'Analisa Studi Kasus Pelanggaran Hak Cipta Perangkat Lunak',
      description: 'Membuat makalah tentang etika profesionalisme dan lisensi open source vs proprietary.',
      course: 'Etika Profesi',
      dueDate: DateTime(2026, 12, 22),
      category: 'Tugas',
      isCompleted: false,
      isFavorite: false,
    ),
    ActivityModel(
      id: 'IK-4',
      title: 'Praktikum Rendering Objek 3D OpenGL',
      description: 'Latihan membuat proyeksi transformasi matriks dan pencahayaan objek 3D.',
      course: 'Grafika Komputer',
      dueDate: DateTime(2026, 12, 23),
      category: 'Kuis',
      isCompleted: false,
      isFavorite: false,
    ),
    ActivityModel(
      id: 'IK-5',
      title: 'Deployment Server pada Instance AWS EC2',
      description: 'Konfigurasi virtual machine cloud, pemetaan IP publik, dan manajemen security group.',
      course: 'Cloud Computing',
      dueDate: DateTime(2026, 12, 24),
      category: 'Proyek',
      isCompleted: false,
      isFavorite: true,
    ),
    ActivityModel(
      id: 'IK-6',
      title: 'Pengujian Unit Testing & Blackbox Testing',
      description: 'Menyusun rencana pengujian perangkat lunak dan laporan eksekusi test case.',
      course: 'Penjaminan Kualitas Perangkat Lunak',
      dueDate: DateTime(2026, 12, 25),
      category: 'Tugas',
      isCompleted: true,
      isFavorite: false,
    ),
    ActivityModel(
      id: 'IK-7',
      title: 'Perancangan Dashboard OLAP & Data Warehouse',
      description: 'Analisis pembuatan ETL dari database OLTP untuk pelaporan Business Intelligence.',
      course: 'Business Intelligence',
      dueDate: DateTime(2026, 12, 26),
      category: 'Proyek',
      isCompleted: false,
      isFavorite: false,
    ),
    ActivityModel(
      id: 'IK-8',
      title: 'Simulasi Algoritma Paralel Menggunakan MPI',
      description: 'Eksperimen pembagian beban komputasi terdistribusi pada multi-node cluster.',
      course: 'Komputasi Paralel dan Terdistribusi',
      dueDate: DateTime(2026, 12, 27),
      category: 'Kuis',
      isCompleted: false,
      isFavorite: false,
    ),
    ActivityModel(
      id: 'IK-9',
      title: 'Review Pembelajaran Model Machine Learning UTS',
      description: 'Mempelajari kembali klasifikasi Decision Tree, Random Forest, dan evaluasi Confusion Matrix.',
      course: 'Kecerdasan Buatan',
      dueDate: DateTime(2026, 12, 28),
      category: 'Ujian',
      isCompleted: false,
      isFavorite: true,
    ),
    ActivityModel(
      id: 'IK-10',
      title: 'Analisis Graph Centrality pada Jejaring Sosial',
      description: 'Perhitungan Degree, Betweenness, dan Closeness Centrality pada struktur jaringan pengguna.',
      course: 'Analisis Jejaring Sosial',
      dueDate: DateTime(2026, 12, 30),
      category: 'Tugas',
      isCompleted: false,
      isFavorite: false,
    ),
  ];

  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  List<ActivityModel> get activities => _activities;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  int get totalActivities => _activities.length;
  int get completedCount => _activities.where((a) => a.isCompleted).length;
  int get pendingCount => _activities.where((a) => !a.isCompleted).length;
  int get favoriteCount => _activities.where((a) => a.isFavorite).length;

  List<ActivityModel> get favoriteActivities =>
      _activities.where((a) => a.isFavorite).toList();

  List<ActivityModel> get filteredActivities {
    return _activities.where((act) {
      final matchesSearch = act.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          act.course.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Semua' || act.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void addActivity(ActivityModel activity) {
    _activities.insert(0, activity);
    notifyListeners();
  }

  void updateActivity(String id, ActivityModel updatedActivity) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index] = updatedActivity;
      notifyListeners();
    }
  }

  void deleteActivity(String id) {
    _activities.removeWhere((a) => a.id == id);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].isFavorite = !_activities[index].isFavorite;
      notifyListeners();
    }
  }

  void toggleCompleted(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].isCompleted = !_activities[index].isCompleted;
      notifyListeners();
    }
  }
}