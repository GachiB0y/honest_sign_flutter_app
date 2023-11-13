import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc bloc, Object? event) async {
    super.onEvent(bloc, event);

    await Sentry.captureMessage(
        'onEvent -- bloc:${bloc.runtimeType}, event:$event');

    log('onEvent -- bloc:${bloc.runtimeType}, event:$event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) async {
    super.onError(bloc, error, stackTrace);
    log('onError -- bloc:${bloc.runtimeType}, error:$error');
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  }
}
