import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  final String username; // Username yang dikirim dari LoginPage

  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Index 0 = Beranda, Index 1 = Profil
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Daftar halaman yang sejajar dalam navigasi BottomNavigationBar
    final List<Widget> pages = [
      const HomePage(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, ${widget.username}'),
        backgroundColor: Color.fromARGB(255, 253, 169, 0),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple, // Warna ikon/teks saat aktif
        unselectedItemColor: Colors.grey, // Warna ikon/teks saat tidak aktif
        onTap: (index) {
          // Memperbarui halaman saat tab diklik
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
