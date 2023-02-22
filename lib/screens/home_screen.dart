import 'package:flutter/material.dart';
import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/themes/app_theme.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Component'),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          title: Text(AppRoutes.menuOptions[i].name),
          leading: Icon( AppRoutes.menuOptions[i].icon, color: AppTheme.primary),
          onTap: () {
            
            // final navigate = MaterialPageRoute(
            //   builder: (context) => const ListViewScreen()
            //   );

            // Navigator.push(context, navigate);

            Navigator.pushNamed(context, AppRoutes.menuOptions[i].route);

          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRoutes.menuOptions.length,
      ),
    );
  }
}