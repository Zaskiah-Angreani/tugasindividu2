import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/activity_model.dart';
import '../providers/activity_provider.dart';

class ActivityFormScreen extends StatefulWidget {
  const ActivityFormScreen({super.key});

  @override
  State<ActivityFormScreen> createState() => _ActivityFormScreenState();
}

class _ActivityFormScreenState extends State<ActivityFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _courseController = TextEditingController();

  String _category = 'Tugas';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String? _editingId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && _editingId == null) {
      _editingId = args as String;
      final provider = Provider.of<ActivityProvider>(context, listen: false);
      final existing = provider.activities.firstWhere((a) => a.id == _editingId);

      _titleController.text = existing.title;
      _descController.text = existing.description;
      _courseController.text = existing.course;
      _category = existing.category;
      _selectedDate = existing.dueDate;
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<ActivityProvider>(context, listen: false);

    if (_editingId == null) {
      final newAct = ActivityModel(
        id: 'IK-${DateTime.now().millisecondsSinceEpoch.toString().substring(10)}',
        title: _titleController.text,
        description: _descController.text,
        course: _courseController.text,
        dueDate: _selectedDate,
        category: _category,
      );
      provider.addActivity(newAct);
    } else {
      final updatedAct = ActivityModel(
        id: _editingId!,
        title: _titleController.text,
        description: _descController.text,
        course: _courseController.text,
        dueDate: _selectedDate,
        category: _category,
      );
      provider.updateActivity(_editingId!, updatedAct);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _editingId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Aktivitas' : 'Tambah Aktivitas Baru'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Judul Tugas / Aktivitas'),
                  validator: (val) => val == null || val.isEmpty ? 'Judul tidak boleh kosong!' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _courseController,
                  decoration: const InputDecoration(labelText: 'Mata Kuliah'),
                  validator: (val) => val == null || val.isEmpty ? 'Mata kuliah tidak boleh kosong!' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _category,
                  decoration: const InputDecoration(labelText: 'Kategori'),
                  items: ['Tugas', 'Kuis', 'Proyek', 'Ujian']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (val) => setState(() => _category = val!),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Deskripsi Detail'),
                  validator: (val) => val == null || val.isEmpty ? 'Deskripsi tidak boleh kosong!' : null,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                        onPressed: _submitForm,
                        child: Text(isEditing ? 'Simpan Perubahan' : 'Tambah Aktivitas',
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}