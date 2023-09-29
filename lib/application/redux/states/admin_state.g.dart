// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminState _$$_AdminStateFromJson(Map<String, dynamic> json) =>
    _$_AdminState(
      reportsState: json['reportsState'] == null
          ? null
          : AdminReportState.fromJson(
              json['reportsState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AdminStateToJson(_$_AdminState instance) =>
    <String, dynamic>{
      'reportsState': instance.reportsState,
    };
