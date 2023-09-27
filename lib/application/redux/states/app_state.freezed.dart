// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  UserState? get userState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  ReportsState? get reportsState => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {UserState? userState,
      BottomNavigationState? bottomNavigationState,
      ReportsState? reportsState,
      @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait});

  $UserStateCopyWith<$Res>? get userState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $ReportsStateCopyWith<$Res>? get reportsState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = freezed,
    Object? bottomNavigationState = freezed,
    Object? reportsState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavigationState: freezed == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      reportsState: freezed == reportsState
          ? _value.reportsState
          : reportsState // ignore: cast_nullable_to_non_nullable
              as ReportsState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState {
    if (_value.bottomNavigationState == null) {
      return null;
    }

    return $BottomNavigationStateCopyWith<$Res>(_value.bottomNavigationState!,
        (value) {
      return _then(_value.copyWith(bottomNavigationState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportsStateCopyWith<$Res>? get reportsState {
    if (_value.reportsState == null) {
      return null;
    }

    return $ReportsStateCopyWith<$Res>(_value.reportsState!, (value) {
      return _then(_value.copyWith(reportsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserState? userState,
      BottomNavigationState? bottomNavigationState,
      ReportsState? reportsState,
      @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait});

  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $ReportsStateCopyWith<$Res>? get reportsState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = freezed,
    Object? bottomNavigationState = freezed,
    Object? reportsState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_$_AppState(
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavigationState: freezed == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      reportsState: freezed == reportsState
          ? _value.reportsState
          : reportsState // ignore: cast_nullable_to_non_nullable
              as ReportsState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {this.userState,
      this.bottomNavigationState,
      this.reportsState,
      @JsonKey(includeFromJson: false, includeToJson: false) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override
  final UserState? userState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final ReportsState? reportsState;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(userState: $userState, bottomNavigationState: $bottomNavigationState, reportsState: $reportsState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                other.bottomNavigationState == bottomNavigationState) &&
            (identical(other.reportsState, reportsState) ||
                other.reportsState == reportsState) &&
            (identical(other.wait, wait) || other.wait == wait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userState, bottomNavigationState, reportsState, wait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {final UserState? userState,
      final BottomNavigationState? bottomNavigationState,
      final ReportsState? reportsState,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  UserState? get userState;
  @override
  BottomNavigationState? get bottomNavigationState;
  @override
  ReportsState? get reportsState;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Wait? get wait;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
