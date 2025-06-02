import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendaftaran Flutter',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _kotaController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Konfirmasi Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama: ${_namaController.text}"),
              Text("Email: ${_emailController.text}"),
              if (_hpController.text.isNotEmpty)
                Text("HP: ${_hpController.text}"),
              Text("Kota: ${_kotaController.text}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // tutup dialog
              },
              child: Text("Kembali"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // tutup dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      nama: _namaController.text,
                      kota: _kotaController.text,
                    ),
                  ),
                );
              },
              child: Text("Lanjut"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Pendaftaran")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: "Nama Lengkap"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Wajib diisi";
                  if (!value.contains('@')) return "Email tidak valid";
                  return null;
                },
              ),
              TextFormField(
                controller: _hpController,
                decoration: InputDecoration(labelText: "Nomor HP (opsional)"),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _kotaController,
                decoration: InputDecoration(labelText: "Kota Domisili"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final String nama;
  final String kota;

  const ConfirmationPage({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konfirmasi")),
      body: Center(
        child: Text(
          "Terima kasih, $nama dari $kota telah mendaftar.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

