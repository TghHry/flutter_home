import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedMenu = "Checkbox";
  bool _isChecked = false;
  bool _isDarkMode = false;
  String? _selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text(_selectedMenu)),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menu Navigasi", style: TextStyle(fontSize: 20)),
              ),
              _buildDrawerItem("Checkbox", Icons.check_box),
              _buildDrawerItem("Switch", Icons.toggle_on),
              _buildDrawerItem("Dropdown", Icons.arrow_drop_down),
              _buildDrawerItem("Tanggal", Icons.calendar_today),
              _buildDrawerItem("Jam", Icons.access_time),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        setState(() => _selectedMenu = title);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody() {
    switch (_selectedMenu) {
      case "Checkbox":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: const Text("Saya menyetujui semua persyaratan yang berlaku"),
              value: _isChecked,
              onChanged: (value) => setState(() => _isChecked = value ?? false),
            ),
            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
            ),
          ],
        );

      case "Switch":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text("Aktifkan Mode Gelap"),
              value: _isDarkMode,
              onChanged: (value) => setState(() => _isDarkMode = value),
            ),
            Text(_isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif"),
          ],
        );

      case "Dropdown":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: const Text("Pilih kategori produk"),
              value: _selectedCategory,
              items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"]
                  .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
            if (_selectedCategory != null)
              Text("Anda memilih kategori: $_selectedCategory"),
          ],
        );

      case "Tanggal":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() => _selectedDate = pickedDate);
                }
              },
              child: const Text("Pilih Tanggal Lahir"),
            ),
            if (_selectedDate != null)
              Text("Tanggal Lahir: ${_formatDate(_selectedDate!)}"),
          ],
        );

      case "Jam":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() => _selectedTime = pickedTime);
                }
              },
              child: const Text("Pilih Waktu Pengingat"),
            ),
            if (_selectedTime != null)
              Text("Pengingat diatur pukul: ${_selectedTime!.format(context)}"),
          ],
        );

      default:
        return const Center(child: Text("Pilih menu dari drawer"));
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return months[month - 1];
  }
}
