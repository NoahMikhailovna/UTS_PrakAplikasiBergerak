import 'package:flutter/material.dart';

class TentangSayaPage extends StatelessWidget {
  const TentangSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header background
            Container(
              width: double.infinity,
              color: Colors.lightBlue[700],
              padding: const EdgeInsets.only(top: 30, bottom: 40),
              child: Column(
                children: [
                  // Foto profil
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlue[200],
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/saya.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Info card
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // NPM
                    _buildInfoRow(Icons.badge_outlined, 'NPM', '20241320038'),
                    const Divider(height: 24),

                    // Nama
                    _buildInfoRow(Icons.person_outline, 'Nama', 'Fakhry Ahmad Fauzan'),
                    const Divider(height: 24),

                    // Program Studi
                    _buildInfoRow(
                        Icons.school_outlined, 'Program Studi', 'Sistem Informasi'),
                    const Divider(height: 24),

                    // Kelas
                    _buildInfoRow(Icons.class_outlined, 'Kelas', 'A-1'),
                  ],
                ),
              ),
            ),

            // Deskripsi
            Transform.translate(
              offset: const Offset(0, -16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sekilas tentang saya...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.lightBlue[100]!),
                      ),
                      child: const Text(
                        'Saya adalah mahasiswa Program Studi Sistem Informasi yang sedang belajar '
                        'pengembangan aplikasi mobile menggunakan Flutter.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.lightBlue[400], size: 22),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            const SizedBox(height: 2),
            Text(value,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
