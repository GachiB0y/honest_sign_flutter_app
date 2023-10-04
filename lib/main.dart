import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/data_provider/session_data_provider.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';

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
  final PalletsRepository palletsRepository = PalletsRepositoryImpl(
      palletsProvider: const BarcodeServiceImpl(),
      sessionDataProvdier: const SessionDataProvdierDefault());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          // PalletCubit(),
          PalletsBloc(palletsRepository: palletsRepository),
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
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child:
                // InputWidget()
                WillPopScope(
                    onWillPop: () async {
                      // Возвращаем `false` для предотвращения закрытия диалогового окна
                      print('BACK');
                      return false;
                    },
                    child: const FirstNewScreen()),
          ),
        ),
      ),
    );
  }
}
