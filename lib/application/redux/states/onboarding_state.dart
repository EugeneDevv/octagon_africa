// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octagon_africa/domain/value_objects/constants.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    String? phoneNumber,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState( 
        phoneNumber: UNKNOWN,
        email: UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        password: UNKNOWN,
      );
}
