import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Layout & Aksi',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _nama = '';
  bool _isLiked = false;
  bool _showDescription = false;
  int _counter = 0;
  bool _showBoxText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Widget'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 1. ElevatedButton
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nama = 'Nama saya: John Doe';
                });
              },
              child: Text('Tampilkan Nama'),
            ),
            if (_nama.isNotEmpty) Text(_nama),

            // 2. IconButton
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
                if (_isLiked) Text('Disukai'),
              ],
            ),

            // 3. TextButton
            TextButton(
              onPressed: () {
                setState(() {
                  _showDescription = !_showDescription;
                });
              },
              child: Text('Lihat Selengkapnya'),
            ),
            if (_showDescription)
              Text('Ini adalah deskripsi tambahan yang ditampilkan.'),

            // 4. Counter dari FloatingActionButton
            Text('Counter: $_counter'),
            // 5. InkWell
            InkWell(
              onTap: () {
                print('Kotak disentuh');
                setState(() {
                  _showBoxText = !_showBoxText;
                });
              },
              child: Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: _showBoxText ? Text('Kotak disentuh', style: TextStyle(color: Colors.white)) : null,
              ),
            ),
            SizedBox(height: 20),

            // 6. GestureDetector
            GestureDetector(
              onTap: () {
                print('Ditekan sekali');
              },
              onDoubleTap: () {
                print('Ditekan dua kali');
              },
              onLongPress: () {
                print('Tahan lama');
              },
              child: Text(
                'Tekan Aku',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
