import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String myNIM = "124240032";

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password == myNIM) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Berhasil!'),
          backgroundColor: Color.fromARGB(255, 253, 169, 0),
          duration: Duration(seconds: 2),
        ),
      );

      // 2. Arahkan ke halaman utama (MainPage / Beranda) dan hapus halaman login dari tumpukan navigasi
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage(username: username)),
      );
    } else {
      // 3. Jika gagal: tampilkan SnackBar berwarna merah dengan pesan "Login gagal!"
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Membersihkan controller ketika widget dihancurkan untuk mencegah kebocoran memori
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FC),
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://www.google.com/imgres?q=logo%20flutter&imgurl=https%3A%2F%2Flogosandtypes.com%2Fwp-content%2Fuploads%2F2021%2F04%2FFlutter.png&imgrefurl=https%3A%2F%2Flogosandtypes.com%2Falphabet%2Fletter-f%2Fflutter%2F&docid=l0QqshsSadXOMM&tbnid=yDaZY3kq0-j6lM&vet=12ahUKEwjXzamqv5WXAxW24zgGHVRLKdUQnPAOegUIogEQAA..i&w=2000&h=2000&hcb=2&ved=2ahUKEwjXzamqv5WXAxW24zgGHVRLKdUQnPAOegUIogEQAA',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9C4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shield,
                          size: 45,
                          color: Color(0xFFFBC02D),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 28),

                  // Field Input untuk Username (bebas)
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Gabriel Bukit',
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Field Input untuk Password (NIM)
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Menyembunyikan karakter password
                    decoration: InputDecoration(
                      hintText: 'Password (NIM)',
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tombol Login berwarna hijau
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 253, 169, 0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed:
                          _login, // Memanggil fungsi _login ketika diklik
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
