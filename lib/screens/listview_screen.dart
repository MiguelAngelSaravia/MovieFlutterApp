import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {

  final options = const ['Megaman', 'Metal Gear', 'Halo', 'streetFighter'];
   
  const ListViewScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewScreen'),
      ),
      body: ListView(
        children: [
        ...options.map((e) => ListTile(
          title: Text(e),
          trailing: const Icon( Icons.arrow_forward_ios_outlined),
        ))
        ],
      )
    );
  }
}