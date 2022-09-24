import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_model.freezed.dart';
part 'flight_model.g.dart';

@freezed
class FlightModel with _$FlightModel {
  @JsonSerializable(explicitToJson: true)
  const factory FlightModel({
    required String from,
    required String to,
    required String flight,
    required String gate,
    required DateTime time,
  }) = _FlightModel;

  const FlightModel._();

  factory FlightModel.fromJson(Map<String, Object?> json) =>
      _$FlightModelFromJson(json);

  Map<String, dynamic> toFormJson() {
    return {
      ...toJson(),
      'time': time,
    };
  }
}
