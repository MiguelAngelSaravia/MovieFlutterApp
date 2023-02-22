import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class CustomCardStyle1 extends StatelessWidget {
  const CustomCardStyle1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:[
          const ListTile(
            leading: Icon(Icons.abc_sharp, color: AppTheme.primary),
            title: Text('Title'),
            subtitle: Text('Reprehenderit commodo amet ex sunt exercitation veniam sit amet non exercitation in commodo exercitation mollit.'),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Cancel')
                ),
          
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok')
                  )
              ],
            ),
          )

        ],
      ),
    );
  }
}