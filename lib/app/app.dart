import 'package:flutter/material.dart';
import 'package:test_news/presentation/home_screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HomeScreen(),
              ],
            ),
          ),
        ));
  }
}
