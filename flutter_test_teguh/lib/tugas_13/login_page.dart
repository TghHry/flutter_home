// import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_8/tugas_8.dart';
// import 'package:flutter_test_teguh/tugas_13/dashboard_page.dart';
// import 'package:flutter_test_teguh/tugas_13/register_page.dart';

// class TugasTigasBelas extends StatefulWidget {
//   const TugasTigasBelas({super.key});
//   static const String id = "/TugasTigaBelas";

//   @override
//   State<TugasTigasBelas> createState() => _TugasTigaBelasState();
// }

// class _TugasTigaBelasState extends State<TugasTigasBelas> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF001F54), // Navy blue
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF001F54),
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TugasDelapan(),
//                 ));
//           },
//         ),
//         title: const Text("Login", style: TextStyle(color: Colors.white)),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),

//               // Header Text
//               const Text(
//                 "Hello Welcome Back",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Welcome back please\nsign in again",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white70, fontSize: 16),
//               ),

//               const SizedBox(height: 40),

//               // Email Field
//               TextField(
//                 style: const TextStyle(color: Colors.white),
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   hintText: "Email",
//                   hintStyle: TextStyle(color: Colors.white70),
//                   prefixIcon: Icon(Icons.email, color: Colors.white70),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Password Field
//               TextField(
//                 obscureText: true,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: "Password",
//                   hintStyle: TextStyle(color: Colors.white70),
//                   prefixIcon: Icon(Icons.lock, color: Colors.white70),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white54),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 40),

//               // Login Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DashboardPage(),
//                         ));
//                   },
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Color(0xFF001F54),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 60),

//               // Divider with "or"
//               Row(
//                 children: const [
//                   Expanded(child: Divider(color: Colors.white54)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text("or", style: TextStyle(color: Colors.white70)),
//                   ),
//                   Expanded(child: Divider(color: Colors.white54)),
//                 ],
//               ),

//               const SizedBox(height: 30),

//               // Facebook Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   icon: const Icon(Icons.facebook, color: Colors.white),
//                   onPressed: () {},
//                   label: const Text(
//                     "Facebook",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // Google Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   icon: Image.asset("assets/images/google3.png", height: 14),
//                   onPressed: () {},
//                   label: Text("Gmail", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//               SizedBox(height: 30),

//               // Sign up link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have an account?",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => RegisterPage(),
//                           ));
//                     },
//                     child: Text(
//                       "   Sign In",
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
