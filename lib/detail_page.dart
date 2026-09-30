import 'package:flutter/material.dart';
import 'pokemon.dart';

// Halaman Detail Mobil untuk menampilkan rincian informasi mobil yang dipilih
class DetailPage extends StatelessWidget {
  final Pokemon
  pokemon; // Menerima objek data mobil yang diklik dari Halaman Beranda

  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar menampilkan nama merek + nama mobil dengan background hijau
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Menampilkan gambar mobil ukuran besar
            Image.network(
              pokemon.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              // Penanganan jika gambar gagal dimuat
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pokemon.id} ${pokemon.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Atribut:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ability: ${pokemon.ability}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  // Berat Pokemon
                  Text(
                    'Berat: ${pokemon.weight} kg',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),

                  const SizedBox(height: 8),

                  // Tinggi Pokemon
                  Text(
                    'Tinggi: ${pokemon.height} m',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
