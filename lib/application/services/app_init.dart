import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/services/app_strings.dart';
import 'package:octagon_africa/application/services/asset_strings.dart';
import 'package:octagon_africa/domain/value_objects/global_keys.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/widgets/octagon_app.dart';

Future<void> appInit() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  final AppState initialState = AppState.initial();
  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    defaultDistinct: true,
  );

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(
      () {
        inDebug = true;
        return true;
      }(),
    );
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }

    // In release builds, show error image
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(errorDisplayImgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          getErrorMessage(),
          style: boldSize16Text(Colors.white),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  };
  runApp(OctagonApp(
    store: store,
  ));
}
