import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilePage(),
    );
  }

  Scaffold profilePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Teguh Hariyanto",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 30,
              ),
              Text(
                "Jakarta Timur",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          Text("Deskipsi : Seorang pelajar yang sedang belajar Flutter"),
        ],
      ),
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profil Saya')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const ProfilePicture(imageUrl: 'https://i.pravatar.cc/150?img=3'),
//             const SizedBox(height: 12),
//             const ProfileName(name: 'Teguh Prasetyo'),
//             const SizedBox(height: 8),
//             const Text('Flutter Developer',
//                 style: TextStyle(color: Colors.grey)),
//             const SizedBox(height: 24),
//             Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               elevation: 5,
//               child: const ListTile(
//                 leading: Icon(Icons.email),
//                 title: Text('teguh@email.com'),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Aksi edit profil
//               },
//               icon: const Icon(Icons.edit),
//               label: const Text('Edit Profil'),
//               style: ElevatedButton.styleFrom(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// --- Komponen kecil di bawah agar tetap rapi ---

// class ProfilePicture extends StatelessWidget {
//   final String imageUrl;

//   const ProfilePicture({required this.imageUrl, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 50,
//       backgroundImage: NetworkImage(imageUrl),
//     );
//   }
// }

// class ProfileName extends StatelessWidget {
//   final String name;

//   const ProfileName({required this.name, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       name,
//       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//             fontWeight: FontWeight.bold,
//           ),
//     );
//   }
// }
