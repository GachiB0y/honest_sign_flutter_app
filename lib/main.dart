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
import 'package:honest_sign_flutter_app/ui/screens/first_screen/new_first_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c086467fa8f0070a0fb1493d77c88819@o4506217719791616.ingest.sentry.io/4506217721036800';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
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
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: WillPopScope(
                  onWillPop: () async {
                    // Возвращаем `false` для предотвращения закрытия диалогового окна

                    return false;
                  },
                  child: const FirstNewScreen()),
            ),
          ),
        ),
      ),
    );
  }
}
