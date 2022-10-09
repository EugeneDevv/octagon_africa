// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      onboardingState: json['onboardingState'] == null
          ? null
          : OnboardingState.fromJson(
              json['onboardingState'] as Map<String, dynamic>),
      bottomNavigationState: json['bottomNavigationState'] == null
          ? null
          : BottomNavigationState.fromJson(
              json['bottomNavigationState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'onboardingState': instance.onboardingState,
      'bottomNavigationState': instance.bottomNavigationState,
    };
