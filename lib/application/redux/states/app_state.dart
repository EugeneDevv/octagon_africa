// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:octagon_africa/application/redux/states/bottom_nav_state.dart';
import 'package:octagon_africa/application/redux/states/onboarding_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can then be pushed during creation
// to create on global app store
@Freezed(makeCollectionsUnmodifiable: false)
class AppState with _$AppState {
  factory AppState({
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        onboardingState: OnboardingState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        wait: Wait(),
      );
}
