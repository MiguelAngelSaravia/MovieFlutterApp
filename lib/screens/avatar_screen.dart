import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Screen'),
        actions: [
          Container(
            margin: const EdgeInsets.only( right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
           maxRadius: 120,
           backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGUHjC4khbMYuGSGfO6fmVjdTu600wYZBRrQ&usqp=CAU'),
         ),
      ),
    );
  }
}