import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_1/meet_1a.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final faker = Faker();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Extract Widget"), centerTitle: true),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ChatItem(
              imageUrl: "https://picsum.photos/id/$index/200/300",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            );
          },
        ),

        //  ListView(
        //   children: [
        //     ChatItem(
        //       imageUrl: "https://picsum.photos/id/1/200/300",
        //       title: faker.person.name(),
        //       subtitle: faker.lorem.sentence(),
        //     ),
        //     ChatItem(
        //       imageUrl: "https://picsum.photos/id/2/200/300",
        //       title: "Andhika",
        //       subtitle: faker.lorem.sentence(),
        //     ),
        //     ChatItem(
        //       imageUrl: "https://picsum.photos/id/3/200/300",
        //       title: faker.person.name(),
        //       subtitle: faker.lorem.sentence(),
        //     ),
        //     ChatItem(
        //       imageUrl: "https://picsum.photos/id/4/200/300",
        //       title: faker.person.name(),
        //       subtitle: faker.lorem.sentence(),
        //     ),
        //     ChatItem(
        //       imageUrl: "https://picsum.photos/id/5/200/300",
        //       title: faker.person.name(),
        //       subtitle: faker.lorem.sentence(),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ChatItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      trailing: Text("10.00"),
    );
  }
}
