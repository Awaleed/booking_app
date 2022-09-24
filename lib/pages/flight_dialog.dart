import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../cubits/flights_cubit.dart';
import '../helpers/helper.dart';
import '../helpers/validators.dart';
import '../models/flight_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/dialog_date_input.dart';
import '../widgets/dialog_text_input.dart';
import '../widgets/flight_card.dart';

class FlightDialogPage extends StatefulWidget {
  const FlightDialogPage({Key? key, this.flight}) : super(key: key);
  final FlightModel? flight;
  @override
  State<FlightDialogPage> createState() => FlightDialogPageState();
}

class FlightDialogPageState extends State<FlightDialogPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    if (widget.flight != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    }
  }

  FlightModel get currentValue {
    final data = formKey.currentState?.fields ?? {};
    return FlightModel(
      from: data['from']?.value ?? '',
      to: data['to']?.value ?? '',
      flight: data['flight']?.value ?? '',
      gate: data['gate']?.value ?? '',
      time: data['time']?.value ?? DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.flight == null
            ? 'Adding new flight'
            : 'Editing ${currentValue.flight}',
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Sava'),
        icon: const Icon(Icons.save),
        onPressed: () {
          Helpers.dismissFauces(context);
          if (formKey.currentState != null &&
              formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (widget.flight == null) {
              context.read<FlightsCubit>().addNewFlight(currentValue);
            } else {
              context.read<FlightsCubit>().updateFlight(currentValue);
            }
            Navigator.of(context).pop();
          }
        },
      ),
      body: FormBuilder(
        key: formKey,
        initialValue: {
          if (widget.flight != null) ...widget.flight!.toFormJson(),
        },
        onChanged: () => setState(() {}),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlightCard(flight: currentValue),
              const SizedBox(height: 10),
              Row(
                children: [
                  const DialogTextInput(
                    name: 'from',
                    hint: 'From',
                    validator: Validators.shortStringValidator,
                  ),
                  const DialogTextInput(
                    name: 'to',
                    hint: 'To',
                    validator: Validators.shortStringValidator,
                  ),
                ].map((e) => Expanded(child: e)).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  DialogTextInput(
                    name: 'flight',
                    hint: 'Flight',
                    validator: Validators.shortStringValidator,
                    enabled: widget.flight == null,
                  ),
                  const DialogTextInput(
                    name: 'gate',
                    hint: 'Gate',
                    validator: Validators.shortStringValidator,
                  ),
                ].map((e) => Expanded(child: e)).toList(),
              ),
              const SizedBox(height: 10),
              const DialogDateInput(
                name: 'time',
                validator: Validators.notNullValidator,
              ),
            ],
          ),
        ),
      ),
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
