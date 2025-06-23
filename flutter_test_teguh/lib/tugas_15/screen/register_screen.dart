import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_15/screen/login_contoh.dart';
import 'package:flutter_test_teguh/tugas_15/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_test_teguh/tugas_15/services/api_services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: RegisterScreen(),
//     );
//   }
// }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final UserService userService = UserService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool isLoading = false;

  void register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final res = await userService.registerUser(
        email: _emailController.text.trim(),
        name: _usernameController.text.trim(),
        password: _passwordController.text,
      );

      print('Register Response: $res');

      if (res['data'] != null ||
          res['user'] != null ||
          res['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration successful!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      } else {
        throw Exception(res['message'] ?? 'Registration failed');
      }
    } catch (e) {
      print('Register Error: $e');
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      if (errorMessage.contains('email has already been taken')) {
        errorMessage = 'Email sudah terdaftar. Gunakan email lain.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_android,
                  size: 100,
                ),
                SizedBox(height: 75),
                Text(
                  "Register",
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
                SizedBox(height: 10),
                Text(
                  "Creat your account",
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
                      child: TextFormField(
                        controller: _usernameController,
                        validator: (val) => val == null || val.isEmpty
                            ? "Username wajib diisi"
                            : null,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          // border: OutlineInputBorder(),
                        ),
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
                      child: TextFormField(
                        controller: _emailController,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return "Email wajib diisi";
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(val)) {
                            return "Email tidak valid";
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        validator: (val) => val == null || val.length < 6
                            ? "Password minimal 6 karakter"
                            : null,
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
                    onPressed: isLoading ? null : register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
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
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/tugas_15/services/api_services.dart';
// import 'package:flutter_test_teguh/tugas_15/screen/login_screen.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//   static const String id = "/register_screen_api";

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final UserService userService = UserService();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   bool _obscurePassword = true;
//   bool isLoading = false;

//   void register() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     try {
//       final res = await userService.registerUser(
//         email: _emailController.text.trim(),
//         name: _usernameController.text.trim(),
//         password: _passwordController.text,
//       );

//       print('Register Response: $res');

//       if (res['data'] != null ||
//           res['user'] != null ||
//           res['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Registration successful!"),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginPage()),
//         );
//       } else {
//         throw Exception(res['message'] ?? 'Registration failed');
//       }
//     } catch (e) {
//       print('Register Error: $e');
//       String errorMessage = e.toString().replaceFirst('Exception: ', '');
//       if (errorMessage.contains('email has already been taken')) {
//         errorMessage = 'Email sudah terdaftar. Gunakan email lain.';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
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
//               "Register",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "Create your account",
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _usernameController,
//                       validator:
//                           (val) =>
//                               val == null || val.isEmpty
//                                   ? "Username wajib diisi"
//                                   : null,
//                       decoration: const InputDecoration(
//                         labelText: "Username",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       controller: _emailController,
//                       validator: (val) {
//                         if (val == null || val.isEmpty)
//                           return "Email wajib diisi";
//                         if (!RegExp(
//                           r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                         ).hasMatch(val)) {
//                           return "Email tidak valid";
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: _obscurePassword,
//                       validator:
//                           (val) =>
//                               val == null || val.length < 6
//                                   ? "Password minimal 6 karakter"
//                                   : null,
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         border: const OutlineInputBorder(),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: isLoading ? null : register,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                         ),
//                         child:
//                             isLoading
//                                 ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                                 : const Text("Register",style: TextStyle(color: Colors.white),),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Already have an account? "),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const LoginPage(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "Sign In",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
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