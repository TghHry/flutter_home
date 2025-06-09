import 'package:flutter_test_teguh/tugas_11_contoh/model.dart';
import 'package:flutter_test_teguh/tugas_11_contoh/database.dart';
import 'package:flutter/material.dart';


class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController ruteController = TextEditingController();
  final TextEditingController waktuController = TextEditingController();
  TimeOfDay? selectedTime;


Future<void> hapusData(int id) async {
  final konfirmasi = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Konfirmasi'),
      content: Text('Yakin ingin menghapus jadwal ini?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
         ],), );

  if (konfirmasi == true) {
    await DbHelper().deleteJadwal(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Data berhasil dihapus')),
    );
    muatData();}}

  List<JadwalBus> jadwalBusList = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
  final data = await DbHelper.getAllJadwal();
    setState(() {
      jadwalBusList = data;
    });
  }
  
  Future<void> ubahData(JadwalBus jadwal) async {
  nameController.text = jadwal.nama;
  kelasController.text = jadwal.kelas.toString();
  ruteController.text = jadwal.rute;
  waktuController.text = jadwal.waktu;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Ubah Jadwal"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInput(
                controller: nameController,
                label: 'Nama Penumpang',
                icon: Icons.person,
              ),
              _buildInput(
                controller: kelasController,
                label: 'Kelas',
                icon: Icons.class_,
                keyboardType: TextInputType.number,
              ),
              _buildInput(
                controller: ruteController,
                label: 'Rute',
                icon: Icons.map,
              ),
              TextFormField(
                controller: waktuController,
                readOnly: true,
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    waktuController.text = picked.format(context);
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Waktu',
                  prefixIcon: Icon(Icons.access_time),
                  fillColor: Color(0xffFFECDB),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final updatedJadwal = JadwalBus(
                id: jadwal.id,
                nama: nameController.text,
                kelas: int.tryParse(kelasController.text) ?? 0,
                rute: ruteController.text,
                waktu: waktuController.text,
              );
              await DbHelper().updateJadwal(updatedJadwal);
              Navigator.pop(context);
              muatData();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('✅ Jadwal berhasil diupdate')),
              );
            },
            child: Text("Simpan"),
          ),],
      );}, );}


  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final nama = nameController.text;
      final kelasText = kelasController.text.trim();
      final kelas = int.tryParse(kelasText);

      if (kelas == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('❌ Format kelas harus berupa angka')),
        );
        return;
      }

      final rute = ruteController.text;
      final waktu = waktuController.text;
      await DbHelper().insertJadwal(
      JadwalBus(nama: nama, kelas: kelas, rute: rute, waktu: waktu),);

      nameController.clear();
      kelasController.clear();
      ruteController.clear();
      waktuController.clear();

      if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Jadwal berhasil disimpan')),
     );} muatData();}}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text(
          ' Jadwal Bus Sekolah',
          style: TextStyle(color: Color(0xffAFDDFF)),
        ),
        backgroundColor: Color(0xff60B5FF),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff60B5FF),
                    Color(0xffAFDDFF),
                    Color(0xff60B5FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Form Input Jadwal',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildInput(
                      controller: nameController,
                      label: 'Nama Penumpang',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama wajib diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildInput(
                      controller: kelasController,
                      label: 'Kelas',
                      icon: Icons.class_,
                      keyboardType: TextInputType.number,
                      //  validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Kelas wajib diisi';
                      //     }
                      //     return null;
                      //   },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kelas wajib diisi';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Kelas harus berupa angka';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildInput(
                      controller: ruteController,
                      label: 'Rute',
                      icon: Icons.map,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Rute wajib diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: waktuController,
                      readOnly: true,
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedTime = picked;
                            waktuController.text = picked.format(context);
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Waktu',
                        prefixIcon: const Icon(Icons.access_time),
                        fillColor: Color(0xffFFECDB),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Waktu wajib dipilih'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan Jadwal'),
                      onPressed: simpanData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '📋 Daftar Jadwal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ...jadwalBusList.map(
              (item) => Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xff60B5FF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xff60B5FF),
                    child: Icon(Icons.directions_bus, color: Color(0xffFF9149)),
                  ),
                  title: Text('${item.nama} (Kelas ${item.kelas})'),
                  subtitle: Text('Rute: ${item.rute} • Waktu: ${item.waktu}'),
                  trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  IconButton(
                  icon: Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => ubahData(item),),
                  IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => hapusData(item.id!),
                  ),],),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        hint: Text(''),
        fillColor: Color(0xffFFECDB),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }
}
