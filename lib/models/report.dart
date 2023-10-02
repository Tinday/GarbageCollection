// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  factory Report({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'reporter') String? reporter,
    @JsonKey(name: 'isHouseWaste') bool? isHouseWaste,
    @JsonKey(name: 'isConstructionWaste') bool? isConstructionWaste,
    @JsonKey(name: 'isIndustrialWaste') bool? isIndustrialWaste,
    @JsonKey(name: 'isElectronicWaste') bool? isElectronicWaste,
    @JsonKey(name: 'isOtherWaste') bool? isOtherWaste,
    @JsonKey(name: 'address_of_dumping') String? addressOfDumping,
    @JsonKey(name: 'is_scheduled') bool? isScheduled,
    @JsonKey(name: 'date_of_collection') String? dateOfCollection,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  factory Report.initial() => Report();
}
