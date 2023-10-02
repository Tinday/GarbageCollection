// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      id: json['id'] as String?,
      reporter: json['reporter'] as String?,
      isHouseWaste: json['isHouseWaste'] as bool?,
      isConstructionWaste: json['isConstructionWaste'] as bool?,
      isIndustrialWaste: json['isIndustrialWaste'] as bool?,
      isElectronicWaste: json['isElectronicWaste'] as bool?,
      isOtherWaste: json['isOtherWaste'] as bool?,
      addressOfDumping: json['address_of_dumping'] as String?,
      isScheduled: json['is_scheduled'] as bool?,
      dateOfCollection: json['date_of_collection'] as String?,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'reporter': instance.reporter,
      'isHouseWaste': instance.isHouseWaste,
      'isConstructionWaste': instance.isConstructionWaste,
      'isIndustrialWaste': instance.isIndustrialWaste,
      'isElectronicWaste': instance.isElectronicWaste,
      'isOtherWaste': instance.isOtherWaste,
      'address_of_dumping': instance.addressOfDumping,
      'is_scheduled': instance.isScheduled,
      'date_of_collection': instance.dateOfCollection,
    };
