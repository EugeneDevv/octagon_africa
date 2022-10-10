import 'package:async_redux/async_redux.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
  });

  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? password;
  @override
  AppState reduce() {
    final AppState newState = state.copyWith.onboardingState!.call(
      phoneNumber: phoneNumber ?? state.onboardingState?.phoneNumber,
      email: email ?? state.onboardingState?.email,
      firstName: firstName ?? state.onboardingState?.firstName,
      lastName: lastName ?? state.onboardingState?.lastName,
      password: password ?? state.onboardingState?.password,
    );

    return newState;
  }
}
