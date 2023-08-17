import 'package:flutter/material.dart';

import 'package:honest_sign_flutter_app/screens/main_screen.dart';
import 'package:honest_sign_flutter_app/screens/refactor_box_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Scaffold(
      //     resizeToAvoidBottomInset: false,
      //     body: SafeArea(child: InputWidget())),
      //   '/refactor_box': (context) => RefactorBoxScreen(),
      // },
      home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(child: InputWidget())),
    );
  }
}
