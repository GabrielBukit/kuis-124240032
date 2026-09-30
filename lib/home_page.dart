import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'detail_page.dart';

// Halaman Beranda untuk menampilkan daftar data mobil menggunakan ListView
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView.builder digunakan untuk menampilkan daftar secara dinamis dan efisien
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          elevation: 0.5,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),

            // Gambar thumbnail mobil di sebelah kiri
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                pokemon.image,
                width: 60,
                height: 50,
                fit: BoxFit.cover,
                // Penanganan jika gambar gagal dimuat dari internet
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.directions_car,
                      size: 30,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            title: Text(
              '#${pokemon.id}. ${pokemon.name}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),

            subtitle: Text(
              pokemon.types.toString(),
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),

            // Ikon panah kanan di sebelah kanan item
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),

            // Ketika salah satu item diklik, pindah ke Halaman Detail Mobil
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(pokemon: pokemon),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
