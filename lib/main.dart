import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallet_cubit.dart';

import 'package:honest_sign_flutter_app/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PalletCubit>(
      create: (context) => PalletCubit(),
      child: MaterialApp(
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
      ),
    );
  }
}
