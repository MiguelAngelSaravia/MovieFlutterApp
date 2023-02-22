import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class SlideScreen extends StatefulWidget {
   
  const SlideScreen({Key? key}) : super(key: key);

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {

  double _sliderValue = 100;
  bool _isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Screen'),
      ),
      body: Column(
         children: [
      
           Slider.adaptive(
             min: 50,
             max: 400,
             activeColor: AppTheme.primary,
             value: _sliderValue, 
             onChanged: _isCheckbox ? ( value ) {
               _sliderValue = value;
               setState(() {});
              } : null
             ),

            //  Checkbox(
            //    value: _isCheckbox, 
            //    onChanged: ( value ) {
            //      _isCheckbox = value ?? true;
            //      setState(() {});
            //    }
            //    ),

              CheckboxListTile(
                value: _isCheckbox,
                title: const Text('Habilitar slider'),
                activeColor: AppTheme.primary,
                onChanged: (value) {
                  _isCheckbox = value ?? true;
                  setState(() {});
                }),

                SwitchListTile.adaptive(
                  value: _isCheckbox,
                  title: const Text('Switch Habilitar Slider'),
                  activeColor: AppTheme.primary,
                  onChanged: (value) {
                    _isCheckbox = value;
                    setState(() {});
                  }),

                  const AboutListTile(),

             Expanded(
               child: SingleChildScrollView(
                 child: Image(
                   image: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3A4Ho-BlPXcvE9mgfowWmX4h6mJ0QBLg8e0hAkOknxHPGMUXv7bcZIYXtIsfqZTcqJ5w&usqp=CAU'),
                   fit: BoxFit.contain,
                   width: _sliderValue,
                   ),
               ),
             )
      
         ],
      ),
    );
  }
}