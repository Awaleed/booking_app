// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketModel _$$_TicketModelFromJson(Map<String, dynamic> json) =>
    _$_TicketModel(
      number: json['number'] as String,
      seat: json['seat'] as String,
      bookedAt: DateTime.parse(json['bookedAt'] as String),
      flight: FlightModel.fromJson(json['flight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TicketModelToJson(_$_TicketModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'seat': instance.seat,
      'bookedAt': instance.bookedAt.toIso8601String(),
      'flight': instance.flight.toJson(),
    };
