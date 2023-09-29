// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      userState: json['userState'] == null
          ? null
          : UserState.fromJson(json['userState'] as Map<String, dynamic>),
      bottomNavigationState: json['bottomNavigationState'] == null
          ? null
          : BottomNavigationState.fromJson(
              json['bottomNavigationState'] as Map<String, dynamic>),
      reportsState: json['reportsState'] == null
          ? null
          : ReportsState.fromJson(json['reportsState'] as Map<String, dynamic>),
      adminState: json['adminState'] == null
          ? null
          : AdminState.fromJson(json['adminState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'userState': instance.userState,
      'bottomNavigationState': instance.bottomNavigationState,
      'reportsState': instance.reportsState,
      'adminState': instance.adminState,
    };
