import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/flight_model.dart';

class FlightsCubit extends HydratedCubit<List<FlightModel>> {
  FlightsCubit() : super(<FlightModel>[]);

  void addNewFlight(FlightModel flight) => emit([...state, flight]);
  void updateFlight(FlightModel flight) {
    final foundIndex =
        state.indexWhere((element) => element.flight == flight.flight);

    final values = List<FlightModel>.from(state, growable: true);

    if (foundIndex != -1) values[foundIndex] = flight;

    emit(values);
  }

  void deleteFlight(FlightModel flight) =>
      emit(state.where((element) => element != flight).toList());

  @override
  List<FlightModel>? fromJson(Map<String, dynamic> json) =>
      (json['data'] as List).map((e) => FlightModel.fromJson(e)).toList();

  @override
  Map<String, dynamic>? toJson(List<FlightModel>? state) =>
      {'data': (state ?? []).map((e) => e.toJson()).toList()};
}
