import 'package:freezed_annotation/freezed_annotation.dart';

import 'flight_model.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
class TicketModel with _$TicketModel {
  @JsonSerializable(explicitToJson: true)
  const factory TicketModel({
    required String number,
    required String seat,
    required DateTime bookedAt,
    required FlightModel flight,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, Object?> json) =>
      _$TicketModelFromJson(json);
}
