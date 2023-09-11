// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      bottomNavigationState: json['bottomNavigationState'] == null
          ? null
          : BottomNavigationState.fromJson(
              json['bottomNavigationState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'bottomNavigationState': instance.bottomNavigationState,
    };
