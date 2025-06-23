import 'dart:math';

import 'package:faker/faker.dart' as fakerLib;
import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_model/product.dart';

class MyHomePageModel extends StatelessWidget {
  final fakerLib.Faker faker = fakerLib.Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
        judul: faker.food.restaurant(),
        imageURL: 'https://picsum.photos/id/$index/200',
        harga: 10000 + Random().nextInt(100000),
        deskripsi: faker.lorem.sentence(),
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text("Market Place")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: dummyData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageURL),
            footer: Container(
              height: 80,
              color: Colors.green.withOpacity(0.5),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dummyData[index].judul,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp ${dummyData[index].harga}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    dummyData[index].deskripsi,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
