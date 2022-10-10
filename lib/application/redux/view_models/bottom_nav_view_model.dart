import 'package:async_redux/async_redux.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';

class BottomNavViewModel extends Vm {
  final int currentIndex;
  final String barTitle;

  BottomNavViewModel({
    required this.currentIndex,
    required this.barTitle,
  }) : super(
          equals: <Object?>[
            currentIndex,
            barTitle,
          ],
        );

  static BottomNavViewModel fromStore(Store<AppState> store) {
    return BottomNavViewModel(
      currentIndex:
          store.state.bottomNavigationState?.currentBottomNavIndex ?? 0,
      barTitle: store.state.bottomNavigationState?.barTitle ?? '',
    );
  }
}
