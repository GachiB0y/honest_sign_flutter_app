import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/bloc_observable.dart';
import 'package:honest_sign_flutter_app/custom_provider.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_service.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/search_barcode_bloc/search_barcode_bloc.dart';
import 'package:honest_sign_flutter_app/domain/data_provider/session_data_provider.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_date_picker/custom_date_pikcer_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:honest_sign_flutter_app/ui/components/view_model/text_field_check_valid_widget_model.dart';
import 'package:honest_sign_flutter_app/ui/screens/first_screen/new_first_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PalletsRepository palletsRepository = PalletsRepositoryImpl(
      palletsProvider: BarcodeServiceImpl(HTTPServiceImpl()),
      sessionDataProvdier: const SessionDataProvdierDefault());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PalletsBloc>(
          create: (BuildContext context) =>
              PalletsBloc(palletsRepository: palletsRepository),
        ),
        BlocProvider<SearchBarcodeBloc>(
          create: (BuildContext context) => SearchBarcodeBloc(),
        ),
      ],
      child: ChangeNotifierProvaider<CustomDatePickerModel>(
        model: CustomDatePickerModel(),
        child: ChangeNotifierProvaider<TextFieldCheckBalidWidgetModel>(
          model: TextFieldCheckBalidWidgetModel(),
          child: MaterialApp(
            title: ' Demo',
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru'), // Установите поддерживаемый язык
            ],
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
              body: SafeArea(
                child: PopScope(canPop: false, child: FirstNewScreen()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
