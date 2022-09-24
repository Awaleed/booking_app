// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) {
  return _FlightModel.fromJson(json);
}

/// @nodoc
mixin _$FlightModel {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get flight => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightModelCopyWith<FlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightModelCopyWith<$Res> {
  factory $FlightModelCopyWith(
          FlightModel value, $Res Function(FlightModel) then) =
      _$FlightModelCopyWithImpl<$Res>;
  $Res call(
      {String from, String to, String flight, String gate, DateTime time});
}

/// @nodoc
class _$FlightModelCopyWithImpl<$Res> implements $FlightModelCopyWith<$Res> {
  _$FlightModelCopyWithImpl(this._value, this._then);

  final FlightModel _value;
  // ignore: unused_field
  final $Res Function(FlightModel) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? flight = freezed,
    Object? gate = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as String,
      gate: gate == freezed
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_FlightModelCopyWith<$Res>
    implements $FlightModelCopyWith<$Res> {
  factory _$$_FlightModelCopyWith(
          _$_FlightModel value, $Res Function(_$_FlightModel) then) =
      __$$_FlightModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String from, String to, String flight, String gate, DateTime time});
}

/// @nodoc
class __$$_FlightModelCopyWithImpl<$Res> extends _$FlightModelCopyWithImpl<$Res>
    implements _$$_FlightModelCopyWith<$Res> {
  __$$_FlightModelCopyWithImpl(
      _$_FlightModel _value, $Res Function(_$_FlightModel) _then)
      : super(_value, (v) => _then(v as _$_FlightModel));

  @override
  _$_FlightModel get _value => super._value as _$_FlightModel;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? flight = freezed,
    Object? gate = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_FlightModel(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as String,
      gate: gate == freezed
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FlightModel extends _FlightModel {
  const _$_FlightModel(
      {required this.from,
      required this.to,
      required this.flight,
      required this.gate,
      required this.time})
      : super._();

  factory _$_FlightModel.fromJson(Map<String, dynamic> json) =>
      _$$_FlightModelFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String flight;
  @override
  final String gate;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'FlightModel(from: $from, to: $to, flight: $flight, gate: $gate, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlightModel &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.flight, flight) &&
            const DeepCollectionEquality().equals(other.gate, gate) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(flight),
      const DeepCollectionEquality().hash(gate),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_FlightModelCopyWith<_$_FlightModel> get copyWith =>
      __$$_FlightModelCopyWithImpl<_$_FlightModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlightModelToJson(
      this,
    );
  }
}

abstract class _FlightModel extends FlightModel {
  const factory _FlightModel(
      {required final String from,
      required final String to,
      required final String flight,
      required final String gate,
      required final DateTime time}) = _$_FlightModel;
  const _FlightModel._() : super._();

  factory _FlightModel.fromJson(Map<String, dynamic> json) =
      _$_FlightModel.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String get flight;
  @override
  String get gate;
  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$_FlightModelCopyWith<_$_FlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}
