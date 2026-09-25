# Study Planner Pribadi (Tugas Individu 2)

Aplikasi Study Planner Pribadi adalah aplikasi manajemen aktivitas dan jadwal belajar mandiri berbasis Flutter yang dirancang untuk membantu mahasiswa mengelola tugas, kuis, proyek, dan ujian secara terorganisir.

---

## Fitur Utama
1. **Manajemen Aktivitas Belajar (CRUD)**:
   - **Create**: Menambah aktivitas belajar baru dengan input ID unik otomatis.
   - **Read**: Menampilkan daftar aktivitas lengkap beserta filter dan statistik.
   - **Update**: Mengedit aktivitas lama pada ID yang sama (disertai opsi Batal).
   - **Delete**: Menghapus aktivitas dengan dialog konfirmasi (`AlertDialog`).
2. **Pencarian & Filter Kategori**: Pencarian real-time berdasarkan judul/mata kuliah serta filter chip kategori (*Tugas, Kuis, Proyek, Ujian*).
3. **Sistem Favorit / Prioritas**: Menandai tugas penting dan memantau counter favorit secara konsisten di seluruh layar.
4. **Penanda Status Selesai**: Menandai tugas yang sudah dikerjakan (*check/uncheck*).

---

##  Daftar 6 Layar Fungsional
1. **Beranda (`HomeScreen`)**: Menampilkan kartu ringkasan statistik (Total, Selesai, Pending, Favorit) dan daftar aktivitas terbaru.
2. **Daftar Aktivitas (`ActivityListScreen`)**: Menampilkan seluruh daftar tugas yang dilengkapi *Search Bar* dan *Filter Chip Kategori*.
3. **Detail Aktivitas (`ActivityDetailScreen`)**: Menampilkan rincian informasi tugas (ID, Judul, Matkul, Kategori, Tenggat, Deskripsi) serta tombol ubah status.
4. **Form Aktivitas (`ActivityFormScreen`)**: Formulir untuk menambah dan mengedit aktivitas yang dilengkapi validasi input dan tombol Batal.
5. **Daftar Favorit (`FavoriteScreen`)**: Menampilkan daftar tugas yang ditandai sebagai favorit/prioritas.
6. **Profil Pengguna (`ProfileScreen`)**: Menampilkan data diri mahasiswa dan informasi akademik.

---

## State Management & Arsitektur
- **State Management**: Menggunakan package `provider` (`ChangeNotifier`) untuk mengelola state memori RAM secara terpusat, konsisten, dan real-time.
- **Navigasi**: Menggunakan *Named Routes* (`/`, `/list`, `/detail`, `/form`, `/favorite`, `/profile`).
- **Reusable Component**: Komponen `ActivityCard` dipisah agar dapat digunakan ulang di berbagai layar.

---

##  Daftar Package & Versi (`pubspec.yaml`)
- `flutter`: **SDK (Flutter 3.13.2+)**
- `provider`: **^6.1.2** (State Management)
- `cupertino_icons`: **^1.0.8** (Ikonografi iOS/Material)
- `flutter_lints`: **^6.0.0** (Dev Dependency - Linter)

---

## Identitas Pengembang
- **Nama**: Zaskiah Angreani
- **Mata Kuliah**: Pemrograman Mobile
- **Institusi**: Universitas Sumatera Utara
