import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 그냥 상태 변경되는거 알려고 짠 코드같음....
class BlocStateOberver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print(bloc.state);
    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print(bloc.state);
    }
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(bloc.state);
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(bloc.state);
    }
    super.onTransition(bloc, transition);
  }
}