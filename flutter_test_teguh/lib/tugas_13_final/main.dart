// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:absensi_sederhana/login_page.dart';
// // import 'package:absensi_sederhana/profil.dart';
// import 'package:flutter_test_teguh/tugas_13_final/login_page.dart';
// import 'package:flutter_test_teguh/tugas_13_final/profil_page.dart';



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();

//   final name = prefs.getString('name');
//   final email = prefs.getString('email');
//   final phone = prefs.getString('phone');

//   runApp(MyApp(
//     isLoggedIn: name != null && email != null && phone != null,
//     name: name,
//     email: email,
//     phone: phone,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   final String? name;
//   final String? email;
//   final String? phone;

//   const MyApp({
//     super.key,
//     required this.isLoggedIn,
//     this.name,
//     this.email,
//     this.phone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login App',
//       debugShowCheckedModeBanner: false,
//       home: isLoggedIn
//           ? ProfilPage(name: name!, email: email!, phone: phone!)
//           : TugasTigasBelas(),
//     );
//   }
// }
