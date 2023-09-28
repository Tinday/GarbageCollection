// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportsState _$ReportsStateFromJson(Map<String, dynamic> json) {
  return _ReportsState.fromJson(json);
}

/// @nodoc
mixin _$ReportsState {
  List<Report?>? get reports => throw _privateConstructorUsedError;
  Report? get selectedReport => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportsStateCopyWith<ReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsStateCopyWith<$Res> {
  factory $ReportsStateCopyWith(
          ReportsState value, $Res Function(ReportsState) then) =
      _$ReportsStateCopyWithImpl<$Res, ReportsState>;
  @useResult
  $Res call(
      {List<Report?>? reports, Report? selectedReport, String? documentId});

  $ReportCopyWith<$Res>? get selectedReport;
}

/// @nodoc
class _$ReportsStateCopyWithImpl<$Res, $Val extends ReportsState>
    implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReportsStateCopyWith<$Res>
    implements $ReportsStateCopyWith<$Res> {
  factory _$$_ReportsStateCopyWith(
          _$_ReportsState value, $Res Function(_$_ReportsState) then) =
      __$$_ReportsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Report?>? reports, Report? selectedReport, String? documentId});

  @override
  $ReportCopyWith<$Res>? get selectedReport;
}

/// @nodoc
class __$$_ReportsStateCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$_ReportsState>
    implements _$$_ReportsStateCopyWith<$Res> {
  __$$_ReportsStateCopyWithImpl(
      _$_ReportsState _value, $Res Function(_$_ReportsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = freezed,
    Object? selectedReport = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_$_ReportsState(
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
class _$_ReportsState implements _ReportsState {
  _$_ReportsState(
      {final List<Report?>? reports, this.selectedReport, this.documentId})
      : _reports = reports;

  factory _$_ReportsState.fromJson(Map<String, dynamic> json) =>
      _$$_ReportsStateFromJson(json);

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
    return 'ReportsState(reports: $reports, selectedReport: $selectedReport, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportsState &&
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
  _$$_ReportsStateCopyWith<_$_ReportsState> get copyWith =>
      __$$_ReportsStateCopyWithImpl<_$_ReportsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportsStateToJson(
      this,
    );
  }
}

abstract class _ReportsState implements ReportsState {
  factory _ReportsState(
      {final List<Report?>? reports,
      final Report? selectedReport,
      final String? documentId}) = _$_ReportsState;

  factory _ReportsState.fromJson(Map<String, dynamic> json) =
      _$_ReportsState.fromJson;

  @override
  List<Report?>? get reports;
  @override
  Report? get selectedReport;
  @override
  String? get documentId;
  @override
  @JsonKey(ignore: true)
  _$$_ReportsStateCopyWith<_$_ReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}
