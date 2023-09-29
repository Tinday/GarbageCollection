// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminReportState _$AdminReportStateFromJson(Map<String, dynamic> json) {
  return _AdminReportState.fromJson(json);
}

/// @nodoc
mixin _$AdminReportState {
  List<Report?>? get reports => throw _privateConstructorUsedError;
  Report? get selectedReport => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminReportStateCopyWith<AdminReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminReportStateCopyWith<$Res> {
  factory $AdminReportStateCopyWith(
          AdminReportState value, $Res Function(AdminReportState) then) =
      _$AdminReportStateCopyWithImpl<$Res, AdminReportState>;
  @useResult
  $Res call(
      {List<Report?>? reports, Report? selectedReport, String? documentId});

  $ReportCopyWith<$Res>? get selectedReport;
}

/// @nodoc
class _$AdminReportStateCopyWithImpl<$Res, $Val extends AdminReportState>
    implements $AdminReportStateCopyWith<$Res> {
  _$AdminReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = freezed,
    Object? selectedReport = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Report?>?,
      selectedReport: freezed == selectedReport
          ? _value.selectedReport
          : selectedReport // ignore: cast_nullable_to_non_nullable
              as Report?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportCopyWith<$Res>? get selectedReport {
    if (_value.selectedReport == null) {
      return null;
    }

    return $ReportCopyWith<$Res>(_value.selectedReport!, (value) {
      return _then(_value.copyWith(selectedReport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AdminReportStateCopyWith<$Res>
    implements $AdminReportStateCopyWith<$Res> {
  factory _$$_AdminReportStateCopyWith(
          _$_AdminReportState value, $Res Function(_$_AdminReportState) then) =
      __$$_AdminReportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Report?>? reports, Report? selectedReport, String? documentId});

  @override
  $ReportCopyWith<$Res>? get selectedReport;
}

/// @nodoc
class __$$_AdminReportStateCopyWithImpl<$Res>
    extends _$AdminReportStateCopyWithImpl<$Res, _$_AdminReportState>
    implements _$$_AdminReportStateCopyWith<$Res> {
  __$$_AdminReportStateCopyWithImpl(
      _$_AdminReportState _value, $Res Function(_$_AdminReportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = freezed,
    Object? selectedReport = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_$_AdminReportState(
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Report?>?,
      selectedReport: freezed == selectedReport
          ? _value.selectedReport
          : selectedReport // ignore: cast_nullable_to_non_nullable
              as Report?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdminReportState implements _AdminReportState {
  _$_AdminReportState(
      {final List<Report?>? reports, this.selectedReport, this.documentId})
      : _reports = reports;

  factory _$_AdminReportState.fromJson(Map<String, dynamic> json) =>
      _$$_AdminReportStateFromJson(json);

  final List<Report?>? _reports;
  @override
  List<Report?>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Report? selectedReport;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'AdminReportState(reports: $reports, selectedReport: $selectedReport, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminReportState &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.selectedReport, selectedReport) ||
                other.selectedReport == selectedReport) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reports),
      selectedReport,
      documentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminReportStateCopyWith<_$_AdminReportState> get copyWith =>
      __$$_AdminReportStateCopyWithImpl<_$_AdminReportState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminReportStateToJson(
      this,
    );
  }
}

abstract class _AdminReportState implements AdminReportState {
  factory _AdminReportState(
      {final List<Report?>? reports,
      final Report? selectedReport,
      final String? documentId}) = _$_AdminReportState;

  factory _AdminReportState.fromJson(Map<String, dynamic> json) =
      _$_AdminReportState.fromJson;

  @override
  List<Report?>? get reports;
  @override
  Report? get selectedReport;
  @override
  String? get documentId;
  @override
  @JsonKey(ignore: true)
  _$$_AdminReportStateCopyWith<_$_AdminReportState> get copyWith =>
      throw _privateConstructorUsedError;
}
