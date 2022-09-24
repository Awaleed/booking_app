// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
mixin _$TicketModel {
  String get number => throw _privateConstructorUsedError;
  String get seat => throw _privateConstructorUsedError;
  DateTime get bookedAt => throw _privateConstructorUsedError;
  FlightModel get flight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res>;
  $Res call(
      {String number, String seat, DateTime bookedAt, FlightModel flight});

  $FlightModelCopyWith<$Res> get flight;
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res> implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  final TicketModel _value;
  // ignore: unused_field
  final $Res Function(TicketModel) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? seat = freezed,
    Object? bookedAt = freezed,
    Object? flight = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      seat: seat == freezed
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String,
      bookedAt: bookedAt == freezed
          ? _value.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as FlightModel,
    ));
  }

  @override
  $FlightModelCopyWith<$Res> get flight {
    return $FlightModelCopyWith<$Res>(_value.flight, (value) {
      return _then(_value.copyWith(flight: value));
    });
  }
}

/// @nodoc
abstract class _$$_TicketModelCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$$_TicketModelCopyWith(
          _$_TicketModel value, $Res Function(_$_TicketModel) then) =
      __$$_TicketModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String number, String seat, DateTime bookedAt, FlightModel flight});

  @override
  $FlightModelCopyWith<$Res> get flight;
}

/// @nodoc
class __$$_TicketModelCopyWithImpl<$Res> extends _$TicketModelCopyWithImpl<$Res>
    implements _$$_TicketModelCopyWith<$Res> {
  __$$_TicketModelCopyWithImpl(
      _$_TicketModel _value, $Res Function(_$_TicketModel) _then)
      : super(_value, (v) => _then(v as _$_TicketModel));

  @override
  _$_TicketModel get _value => super._value as _$_TicketModel;

  @override
  $Res call({
    Object? number = freezed,
    Object? seat = freezed,
    Object? bookedAt = freezed,
    Object? flight = freezed,
  }) {
    return _then(_$_TicketModel(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      seat: seat == freezed
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String,
      bookedAt: bookedAt == freezed
          ? _value.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as FlightModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TicketModel implements _TicketModel {
  const _$_TicketModel(
      {required this.number,
      required this.seat,
      required this.bookedAt,
      required this.flight});

  factory _$_TicketModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketModelFromJson(json);

  @override
  final String number;
  @override
  final String seat;
  @override
  final DateTime bookedAt;
  @override
  final FlightModel flight;

  @override
  String toString() {
    return 'TicketModel(number: $number, seat: $seat, bookedAt: $bookedAt, flight: $flight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketModel &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.seat, seat) &&
            const DeepCollectionEquality().equals(other.bookedAt, bookedAt) &&
            const DeepCollectionEquality().equals(other.flight, flight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(seat),
      const DeepCollectionEquality().hash(bookedAt),
      const DeepCollectionEquality().hash(flight));

  @JsonKey(ignore: true)
  @override
  _$$_TicketModelCopyWith<_$_TicketModel> get copyWith =>
      __$$_TicketModelCopyWithImpl<_$_TicketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketModelToJson(
      this,
    );
  }
}

abstract class _TicketModel implements TicketModel {
  const factory _TicketModel(
      {required final String number,
      required final String seat,
      required final DateTime bookedAt,
      required final FlightModel flight}) = _$_TicketModel;

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$_TicketModel.fromJson;

  @override
  String get number;
  @override
  String get seat;
  @override
  DateTime get bookedAt;
  @override
  FlightModel get flight;
  @override
  @JsonKey(ignore: true)
  _$$_TicketModelCopyWith<_$_TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
