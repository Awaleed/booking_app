import 'package:freezed_annotation/freezed_annotation.dart';

import 'ticket_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserType { admin, user }

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required String username,
    required String password,
    required UserType type,
    @Default(<TicketModel>[]) List<TicketModel> tickets,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
