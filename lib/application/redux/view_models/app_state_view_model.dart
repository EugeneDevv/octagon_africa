// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
// Project imports:

class AppStateViewModel extends Vm {
  AppStateViewModel({
    required this.appState,
    required this.wait,
  }) : super(equals: <Object?>[appState, wait]);

  final AppState appState;
  final Wait? wait;

  static AppStateViewModel fromStore(Store<AppState> store) {
    return AppStateViewModel(
      appState: store.state,
      wait: store.state.wait,
    );
  }
}
