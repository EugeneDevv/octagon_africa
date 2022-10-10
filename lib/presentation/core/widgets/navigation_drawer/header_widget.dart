import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/redux/view_models/app_state_view_model.dart';
import 'package:octagon_africa/application/services/asset_strings.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Row(
            children: <Widget>[
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(profileIconPngPath),
                backgroundColor: Colors.transparent,
              ),
              mediumHorizontalSizedBox,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${vm.appState.onboardingState?.firstName ?? ''} ${vm.appState.onboardingState?.lastName ?? ''}',
                      style: boldSize14Text(
                        AppColors.whiteColor,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      vm.appState.onboardingState?.email ?? '',
                      style: normalSize14Text(
                        AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
