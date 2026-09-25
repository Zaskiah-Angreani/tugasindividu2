import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text('Zaskiah Angreani', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Mahasiswa Ilmu Komputer', style: TextStyle(color: Colors.grey)),
              Divider(height: 32),
              ListTile(
                leading: Icon(Icons.school, color: Colors.deepPurple),
                title: Text('Universitas Sumatera Utara'),
                subtitle: Text('Pemrograman Mobile - Target UTS'),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.deepPurple),
                title: Text('Email'),
                subtitle: Text('zaskiah@gmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}