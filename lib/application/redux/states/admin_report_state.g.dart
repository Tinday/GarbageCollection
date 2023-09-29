// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_report_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminReportState _$$_AdminReportStateFromJson(Map<String, dynamic> json) =>
    _$_AdminReportState(
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedReport: json['selectedReport'] == null
          ? null
          : Report.fromJson(json['selectedReport'] as Map<String, dynamic>),
      documentId: json['documentId'] as String?,
    );

Map<String, dynamic> _$$_AdminReportStateToJson(_$_AdminReportState instance) =>
    <String, dynamic>{
      'reports': instance.reports,
      'selectedReport': instance.selectedReport,
      'documentId': instance.documentId,
    };
