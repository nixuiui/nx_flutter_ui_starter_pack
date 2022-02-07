import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_box.dart';
import 'package:nx_flutter_ui_starter_pack/nx_card.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({ Key? key }) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxCard Widget"),
      ),
      body: ListView(
        children: [
          NxCard(
            padding: const EdgeInsets.all(20),
            title: NxText.title("Title"),
            actions: const [
              Icon(Icons.more_vert),
            ],
            child: NxBox(
              height: 200,
              borderRadius: 8,
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}