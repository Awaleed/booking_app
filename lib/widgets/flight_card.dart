import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import '../cubits/flights_cubit.dart';
import '../cubits/user_cubit.dart';
import '../helpers/dialogs_helpers.dart';
import '../helpers/helper.dart';
import '../models/flight_model.dart';
import '../models/ticket_model.dart';
import '../models/user_model.dart';
import '../pages/flight_dialog.dart';
import 'flutter_ticket_widget.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({
    super.key,
    required this.flight,
    this.showControls = false,
  });
  final FlightModel flight;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(
      builder: (context, state) {
        final isBooked = state!.tickets.map((e) => e.flight).contains(flight);
        TicketModel? ticket;
        if (isBooked) {
          ticket = state.tickets.firstWhere((e) => e.flight == flight);
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: FlutterTicketWidget(
            width: double.infinity,
            color:
                Colors.primaries[flight.hashCode % 18].shade200.withOpacity(.5),
            isCornerRounded: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Spacer(),
                              Row(
                                children: <Widget>[
                                  Text(
                                    flight.from.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.flight_takeoff,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      flight.to.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Flight Ticket',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: <Widget>[
                                ticketDetailsWidget(
                                  'Flight',
                                  flight.flight.toUpperCase(),
                                  'Gate',
                                  flight.gate.toUpperCase(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 40.0),
                                  child: ticketDetailsWidget(
                                    'Date',
                                    DateFormat('yyyy-MM-dd')
                                        .format(flight.time),
                                    '',
                                    '',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (isBooked)
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: PlayAnimationBuilder(
                            tween: 10.0.tweenTo(1.0),
                            duration: 1500.milliseconds,
                            curve: Curves.bounceOut,
                            builder: (context, value, child) => Transform.scale(
                              scale: value,
                              child: child,
                            ),
                            child: Transform.rotate(
                              angle: (pi) / 20,
                              child: const FittedBox(
                                child: Text(
                                  'BOOKED',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (ticket != null) ...[
                    const Divider(color: Colors.black),
                    ticketDetailsWidget(
                      'Booked At',
                      DateFormat('yyyy-MM-dd').format(ticket.bookedAt),
                      'Seat',
                      ticket.seat,
                    ),
                    const SizedBox(height: 10),
                    BarcodeWidget(
                      barcode: Barcode.pdf417(),
                      data: ticket.number,
                      drawText: true,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      height: 75,
                    ),
                    Text(
                      ticket.number,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  if (showControls)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (context.read<UserCubit>().state?.type ==
                            UserType.admin) ...[
                          IconButton(
                            color: Colors.red,
                            icon: const Icon(Icons.delete),
                            onPressed: () => DialogsHelpers.showWarningDialog(
                              context,
                              confirmationCallback: () => context
                                  .read<FlightsCubit>()
                                  .deleteFlight(flight),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => Helpers.navigate(
                              context,
                              FlightDialogPage(flight: flight),
                            ),
                          ),
                        ] else ...[
                          if (isBooked)
                            OutlinedButton.icon(
                              icon: const Icon(Icons.remove),
                              label: const Text('Unbook'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              onPressed: () => DialogsHelpers.showMessageDialog(
                                context,
                                message: 'Unbook flight ${flight.flight} now?',
                                confirmationCallback: () {
                                  context
                                      .read<UserCubit>()
                                      .unbookFlight(flight);
                                },
                              ),
                            )
                          else
                            OutlinedButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text('Book Now'),
                              onPressed: () => DialogsHelpers.showMessageDialog(
                                context,
                                message: 'Book flight ${flight.flight} now?',
                                confirmationCallback: () {
                                  context.read<UserCubit>().bookFlight(flight);
                                },
                              ),
                            ),
                        ],
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
