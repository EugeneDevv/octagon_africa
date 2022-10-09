// Flutter imports:

import 'package:async_redux/async_redux.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:octagon_africa/domain/value_objects/constants.dart';
import 'package:octagon_africa/presentation/core/widgets/octagon_app.dart';

class AppEntryPointViewModelFactory extends VmFactory<AppState, OctagonApp> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      idToken: UNKNOWN,
      userId: UNKNOWN,
    );
  }
}
