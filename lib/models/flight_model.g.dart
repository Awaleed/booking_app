// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlightModel _$$_FlightModelFromJson(Map<String, dynamic> json) =>
    _$_FlightModel(
      from: json['from'] as String,
      to: json['to'] as String,
      flight: json['flight'] as String,
      gate: json['gate'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_FlightModelToJson(_$_FlightModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'flight': instance.flight,
      'gate': instance.gate,
      'time': instance.time.toIso8601String(),
    };
