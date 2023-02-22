import 'package:flutter/material.dart';
import 'package:flutter_components/models/menu_option.dart';

import 'package:flutter_components/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'listView1', icon: Icons.list_sharp, name: 'listView1 Screen', screen: const ListViewScreen()),
    MenuOption(route: 'listView2', icon: Icons.home_repair_service, name: 'listView2 Screen', screen: const ListView2Screen()),
    MenuOption(route: 'listCard', icon: Icons.add_card, name: 'listCard Screen', screen: const CardScreen()),
    MenuOption(route: 'listAlert', icon: Icons.alarm, name: 'listAlert Screen', screen: const AlertScreen()),
    MenuOption(route: 'avatar', icon: Icons.image, name: 'Avatar Screen', screen: const AvatarScreen()),
    MenuOption(route: 'animate', icon: Icons.animation, name: 'Animated Screen', screen: const AnimatedScreen()),
    MenuOption(route: 'inputs', icon: Icons.input_rounded, name: 'Inputs Screen', screen: const InputsScreen()),
    MenuOption(route: 'slider', icon: Icons.slideshow_outlined, name: 'Slider Screen', screen: const SlideScreen()),
    MenuOption(route: 'builder', icon: Icons.list_alt, name: 'Builder Screen', screen: const ListViewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
      appRoutes.addAll({ 'home' : ( BuildContext context ) => const HomeScreen() });

    for (final option in menuOptions) {
      appRoutes.addAll({ option.route : ( BuildContext context ) => option.screen });
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //       'home': (BuildContext context ) => const HomeScreen(),
  //       'listView1': (BuildContext context ) => const ListViewScreen(),
  //       'listView2': (BuildContext context ) => const ListView2Screen(),
  //       'listCard': (BuildContext context ) => const CardScreen(),
  //       'listAlert': (BuildContext context ) => const AlertScreen(),
  // };

  static Route<dynamic> onGenerateRoute( RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
      );
  }
}