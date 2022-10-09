import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/redux/view_models/app_state_view_model.dart';
import 'package:octagon_africa/application/services/app_strings.dart';
import 'package:octagon_africa/application/services/asset_strings.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class GreetingComponent extends StatelessWidget {
  const GreetingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.srcOver,
                ),
                fit: BoxFit.cover,
                image: const AssetImage(moodSelectionBackgroundUrl),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  greeting(vm.appState.onboardingState?.firstName ?? ''),
                  style: boldSize24Text(AppColors.whiteColor),
                ),
                veryLargeVerticalSizedBox,
                Text(
                  'Nice to have you back',
                  style: boldSize14Text(AppColors.whiteColor),
                ),
              ],
            ),
          );
        });
  }
}
