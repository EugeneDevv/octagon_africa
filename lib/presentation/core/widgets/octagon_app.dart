import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:octagon_africa/application/redux/view_models/app_entry_point_view_model_factory.dart';
import 'package:octagon_africa/domain/value_objects/app_widget_keys.dart';
import 'package:octagon_africa/domain/value_objects/global_keys.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/router/app_router.dart';
import 'package:octagon_africa/presentation/router/routes.dart';

class OctagonApp extends StatelessWidget {
  const OctagonApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreProviderKey,
      store: store,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
          vm: () => AppEntryPointViewModelFactory(),
          builder: (BuildContext context, AppEntryPointViewModel vm) {
            return MaterialApp(
              theme: AppTheme.getAppTheme(),
              navigatorKey: appGlobalNavigatorKey,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRoutes.loginPage,
            );
          }),
    );
  }
}
