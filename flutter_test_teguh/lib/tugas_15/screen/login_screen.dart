import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_teguh/tugas_15/services/api_services.dart';
import 'package:flutter_test_teguh/tugas_15/screen/register_screen.dart';
import 'package:flutter_test_teguh/tugas_15/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserService _userService = UserService();
  bool _obscurePassword = true;
  bool isLoading = false;

  void login() async {
    FocusScope.of(context).unfocus(); // tutup keyboard
    setState(() => isLoading = true);

    try {
      final res = await _userService.loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      print('Login Response: $res');

      final token = res['data']?['token'];
      final user = res['data']?['user'];

      if (token != null) {
        // simpan ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        if (user != null) {
          await prefs.setString('user', user['name'] ?? '');
        }

        // tampilkan notifikasi
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login berhasil"),
            backgroundColor: Colors.green,
          ),
        );

        // navigasi ke home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileUserScreen()),
        );
      } else {
        throw Exception('Token tidak ditemukan. Login gagal.');
      }
    } catch (e) {
      print('Login Error: $e');
      String errorMessage = e.toString().replaceFirst('Exception: ', '');

      if (errorMessage.contains('Email belum terdaftar')) {
        errorMessage = 'Email belum terdaftar. Silakan registrasi.';
      } else if (e is TimeoutException) {
        errorMessage = 'Waktu koneksi habis. Coba lagi.';
      } else if (errorMessage.contains('SocketException')) {
        errorMessage = 'Tidak ada koneksi internet.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          action: errorMessage.contains('registrasi')
              ? SnackBarAction(
                  label: 'Daftar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                )
              : null,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.android,
                size: 100,
              ),
              SizedBox(height: 75),
              Text(
                "Hello Again!",
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome back, you\'ve been missed!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        // border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        // border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 370,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Isi semua field"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          login();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_test_teguh/tugas_15/services/api_services.dart';
// import 'package:flutter_test_teguh/tugas_15/screen/register_screen.dart';
// import 'package:flutter_test_teguh/tugas_15/screen/home_screen.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final UserService _userService = UserService();
//   bool _obscurePassword = true;
//   bool isLoading = false;

//   void login() async {
//     FocusScope.of(context).unfocus(); // tutup keyboard
//     setState(() => isLoading = true);

//     try {
//       final res = await _userService.loginUser(
//         email: _emailController.text.trim(),
//         password: _passwordController.text,
//       );

//       print('Login Response: $res');

//       final token = res['data']?['token'];
//       final user = res['data']?['user'];

//       if (token != null) {
//         // simpan ke SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('token', token);
//         if (user != null) {
//           await prefs.setString('user', user['name'] ?? '');
//         }

//         // tampilkan notifikasi
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Login berhasil"),
//             backgroundColor: Colors.green,
//           ),
//         );

//         // navigasi ke home
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileUserScreen()),
//         );
//       } else {
//         throw Exception('Token tidak ditemukan. Login gagal.');
//       }
//     } catch (e) {
//       print('Login Error: $e');
//       String errorMessage = e.toString().replaceFirst('Exception: ', '');

//       if (errorMessage.contains('Email belum terdaftar')) {
//         errorMessage = 'Email belum terdaftar. Silakan registrasi.';
//       } else if (e is TimeoutException) {
//         errorMessage = 'Waktu koneksi habis. Coba lagi.';
//       } else if (errorMessage.contains('SocketException')) {
//         errorMessage = 'Tidak ada koneksi internet.';
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//           action:
//               errorMessage.contains('registrasi')
//                   ? SnackBarAction(
//                     label: 'Daftar',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const RegisterPage(),
//                         ),
//                       );
//                     },
//                   )
//                   : null,
//         ),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf7f8fa),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipPath(
//                   clipper: BottomCurveClipper(),
//                   child: Image.asset(
//                     'assets/images/porsche.jpg',
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Welcome Back",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "Login to your account",
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Email",
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: _passwordController,
//                     obscureText: _obscurePassword,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       border: const OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscurePassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscurePassword = !_obscurePassword;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 48,
//                     child: ElevatedButton(
//                       onPressed:
//                           isLoading
//                               ? null
//                               : () {
//                                 if (_emailController.text.isEmpty ||
//                                     _passwordController.text.isEmpty) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text("Isi semua field"),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                   return;
//                                 }
//                                 login();
//                               },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                       ),
//                       child:
//                           isLoading
//                               ? const CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                               : const Text("Login",style: TextStyle(color: Colors.white),),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Belum punya akun? "),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterPage(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           "Daftar",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height - 50,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }