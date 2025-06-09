import 'package:flutter/material.dart';

class TugasFlutter2 extends StatelessWidget {
  const TugasFlutter2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Lengkap"),
      ),
      body: Column(children: [
        SizedBox(height: 20),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purpleAccent])),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/luffy2.jpg"),
                    radius: 40,
                    // backgroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: Text(
            "Teguh Hariyanto",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Row(children: [
                Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 210),
                Text("xxx@gmail.com", style: TextStyle(fontSize: 16)),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Row(
            children: [
              Icon(
                Icons.phone,
                size: 30,
              ),
              Spacer(),
              Text(
                "0812-3456-7890",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Postingan",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Follower",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0),
        Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Nama Saya xxx,saat ini saya sedang belajar menjadi mobile programer "
                    "saya mempunyai hobi mendengarkan lagu, saya juga mempunyai hobi bermain game"
                    "saya suka berolahraga, terutama lari dan renang",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orangeAccent,
                Colors.deepOrangeAccent,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ]),
    );
  }
}
