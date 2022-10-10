// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';

// Project imports:

class BottomNavAction extends ReduxAction<AppState> {
  BottomNavAction(
      {required this.currentBottomNavIndex, required this.barTitle});

  final int currentBottomNavIndex;
  final String barTitle;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.bottomNavigationState!
        .call(currentBottomNavIndex: currentBottomNavIndex, barTitle: barTitle);

    return newState;
  }
}
