import 'package:faker/faker.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/flight_model.dart';
import '../models/ticket_model.dart';
import '../models/user_model.dart';

class UserCubit extends HydratedCubit<UserModel?> {
  UserCubit() : super(null);

  final UsersCubit usersCubit = UsersCubit();

  @override
  UserModel? fromJson(Map<String, dynamic> json) {
    try {
      return UserModel.fromJson(json['data']);
    } catch (e) {
      //
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(UserModel? state) {
    return {
      "data": state?.toJson(),
    };
  }

  void login({
    required String username,
    required String password,
  }) {
    for (var user in usersCubit.state) {
      if (user.username == username && user.password == password) {
        return emit(user);
      }
    }
  }

  void logout() => emit(null);

  void register({
    required String username,
    required String password,
    required UserType type,
  }) {
    for (var user in usersCubit.state) {
      if (user.username == username) return;
    }

    final user = UserModel(username: username, password: password, type: type);
    usersCubit.add(user);
    return emit(user);
  }

  void bookFlight(FlightModel flight) {
    final user = state!.copyWith(tickets: [
      ...state!.tickets,
      TicketModel(
        number: faker.randomGenerator.fromPattern(
          ['####-####-####-####'],
        ),
        seat:
            '${faker.randomGenerator.fromCharSet('ABCDEF', 1)}${faker.randomGenerator.integer(30, min: 1)}',
        bookedAt: DateTime.now(),
        flight: flight,
      ),
    ]);
    usersCubit.update(user);
    emit(user);
  }

  void unbookFlight(FlightModel flight) {
    final user = state!.copyWith(
      tickets:
          state!.tickets.where((element) => element.flight != flight).toList(),
    );
    usersCubit.update(user);
    emit(user);
  }
}

class UsersCubit extends HydratedCubit<List<UserModel>> {
  UsersCubit() : super([]);

  @override
  List<UserModel> fromJson(Map<String, dynamic> json) {
    try {
      return (json['data'] as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      //
    }

    return [];
  }

  @override
  Map<String, dynamic>? toJson(List<UserModel> state) {
    return {
      "data": state.map((e) => e.toJson()).toList(),
    };
  }

  void add(UserModel user) {
    return emit([...state, user]);
  }

  void update(UserModel user) {
    final foundIndex =
        state.indexWhere((element) => element.username == user.username);

    final values = List<UserModel>.from(state, growable: true);

    if (foundIndex != -1) values[foundIndex] = user;

    emit(values);
  }
}
