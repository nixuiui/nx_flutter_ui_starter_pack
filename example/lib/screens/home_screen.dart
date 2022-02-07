import 'package:example/screens/box_screen.dart';
import 'package:example/screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starter Pack"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const NxText('Box'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const BoxScreen()
            )),
          ),
          const Divider(),
          ListTile(
            title: const NxText('Button'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const CardScreen()
            )),
          ),
          const Divider(),
        ],
      ),
    );
  }
}