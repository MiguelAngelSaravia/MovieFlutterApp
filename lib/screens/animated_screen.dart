import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _widht = 100;
  double _height = 100;
  Color _color  = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void changeShape() {
    final random = Random();
    _widht = random.nextInt(300).toDouble() + 70;
    _height = random.nextInt(300).toDouble() + 70;
    _color = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
         child: AnimatedContainer(
           duration: const Duration(milliseconds: 400),
           curve: Curves.easeOutCubic,
           width: _widht,
           height: _height,
           decoration: BoxDecoration(
             color: _color,
             borderRadius: _borderRadius
           ),
         ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(  Icons.play_circle_outline, size: 35, )
        ),

    );
  }
}