// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminState _$AdminStateFromJson(Map<String, dynamic> json) {
  return _AdminState.fromJson(json);
}

/// @nodoc
mixin _$AdminState {
  AdminReportState? get reportsState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call({AdminReportState? reportsState});

  $AdminReportStateCopyWith<$Res>? get reportsState;
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportsState = freezed,
  }) {
    return _then(_value.copyWith(
      reportsState: freezed == reportsState
          ? _value.reportsState
          : reportsState // ignore: cast_nullable_to_non_nullable
              as AdminReportState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdminReportStateCopyWith<$Res>? get reportsState {
    if (_value.reportsState == null) {
      return null;
    }

    return $AdminReportStateCopyWith<$Res>(_value.reportsState!, (value) {
      return _then(_value.copyWith(reportsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AdminStateCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$_AdminStateCopyWith(
          _$_AdminState value, $Res Function(_$_AdminState) then) =
      __$$_AdminStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AdminReportState? reportsState});

  @override
  $AdminReportStateCopyWith<$Res>? get reportsState;
}

/// @nodoc
class __$$_AdminStateCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$_AdminState>
    implements _$$_AdminStateCopyWith<$Res> {
  __$$_AdminStateCopyWithImpl(
      _$_AdminState _value, $Res Function(_$_AdminState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportsState = freezed,
  }) {
    return _then(_$_AdminState(
      reportsState: freezed == reportsState
          ? _value.reportsState
          : reportsState // ignore: cast_nullable_to_non_nullable
              as AdminReportState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdminState implements _AdminState {
  _$_AdminState({this.reportsState});

  factory _$_AdminState.fromJson(Map<String, dynamic> json) =>
      _$$_AdminStateFromJson(json);

  @override
  final AdminReportState? reportsState;

  @override
  String toString() {
    return 'AdminState(reportsState: $reportsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminState &&
            (identical(other.reportsState, reportsState) ||
                other.reportsState == reportsState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reportsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminStateCopyWith<_$_AdminState> get copyWith =>
      __$$_AdminStateCopyWithImpl<_$_AdminState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminStateToJson(
      this,
    );
  }
}

abstract class _AdminState implements AdminState {
  factory _AdminState({final AdminReportState? reportsState}) = _$_AdminState;

  factory _AdminState.fromJson(Map<String, dynamic> json) =
      _$_AdminState.fromJson;

  @override
  AdminReportState? get reportsState;
  @override
  @JsonKey(ignore: true)
  _$$_AdminStateCopyWith<_$_AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}
