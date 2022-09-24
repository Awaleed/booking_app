import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/flights_cubit.dart';
import '../cubits/user_cubit.dart';
import '../helpers/helper.dart';
import '../models/flight_model.dart';
import '../models/user_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/flight_card.dart';
import 'flight_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Welcome, ${context.read<UserCubit>().state?.username}",
      ),
      floatingActionButton: const AddFlightButton(),
      body: BlocBuilder<FlightsCubit, List<FlightModel>>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) => FlightCard(
              flight: state[index],
              showControls: true,
            ),
            itemCount: state.length,
          );
        },
      ),
    );
  }
}

class AddFlightButton extends StatelessWidget {
  const AddFlightButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(
      builder: (context, state) {
        if (state?.type == UserType.admin) {
          return FloatingActionButton.extended(
            label: const Text('Add New Flight'),
            icon: const Icon(Icons.add),
            onPressed: () {
              Helpers.navigate(context, const FlightDialogPage());
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
