import 'package:flutter/material.dart';
import 'package:movie_app/screens/main_screen.dart';

import 'di/di.dart';

void main() async {
  await getItInit();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
