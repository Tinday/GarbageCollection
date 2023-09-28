// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportsState _$$_ReportsStateFromJson(Map<String, dynamic> json) =>
    _$_ReportsState(
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedReport: json['selectedReport'] == null
          ? null
          : Report.fromJson(json['selectedReport'] as Map<String, dynamic>),
      documentId: json['documentId'] as String?,
    );

Map<String, dynamic> _$$_ReportsStateToJson(_$_ReportsState instance) =>
    <String, dynamic>{
      'reports': instance.reports,
      'selectedReport': instance.selectedReport,
      'documentId': instance.documentId,
    };
