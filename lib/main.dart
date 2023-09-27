import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallet_cubit.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';

import 'package:honest_sign_flutter_app/ui/screens/main_screen.dart';
import 'package:honest_sign_flutter_app/ui/screens/new_first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PalletsRepository palletsRepository =
      PalletsRepositoryImpl(palletsProvider: const BarcodeServiceImpl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PalletsBloc(palletsRepository: palletsRepository),
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
          body: SafeArea(
            child: FirstNewScreen(),
          ),
        ),
      ),
    );
  }
}
