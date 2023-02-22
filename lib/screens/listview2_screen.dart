import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class ListView2Screen extends StatelessWidget {

  final options = const ['Megaman', 'Metal Gear', 'Halo', 'streetFighter'];
   
  const ListView2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView2Screen'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(options[i]),
          trailing: const Icon( Icons.arrow_forward_ios_outlined, color: AppTheme.primary),
          onTap: () => print(options[i]),
        ),
        separatorBuilder: (_, __) => const Divider()
      )
    );
  }
}