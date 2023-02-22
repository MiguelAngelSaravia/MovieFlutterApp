import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        children: const [
          CustomCardStyle1(),
          SizedBox(height: 15),
          CustomCardType2(title: 'Paisaje 1', imageUrl: 'https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg?cs=srgb&dl=pexels-james-wheeler-1619317.jpg&fm=jpg'),
          SizedBox(height: 15),
          CustomCardType2(title: 'Paisaje 2', imageUrl: 'https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&w=1600'),
          SizedBox(height: 15),
          CustomCardType2(imageUrl: 'https://images.pexels.com/photos/2387418/pexels-photo-2387418.jpeg?auto=compress&cs=tinysrgb&w=1600'),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}