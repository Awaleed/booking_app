import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../helpers/helper.dart';

class DialogDateInput extends StatelessWidget {
  const DialogDateInput({
    Key? key,
    required this.name,
    this.prefix,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.lastDate,
    this.startDate,
    this.enabled = true,
    this.margin = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  }) : super(key: key);

  final String name;
  final String? prefix;
  final String? Function(DateTime?)? validator;
  final dynamic Function(DateTime?)? valueTransformer;
  final bool enabled;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime? lastDate;
  final DateTime? startDate;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: name,
      validator: validator,
      valueTransformer: valueTransformer,
      enabled: enabled,
      onChanged: onChanged,
      builder: (field) {
        return Padding(
          padding: margin,
          child: InputDecorator(
            decoration: InputDecoration(
              border: InputBorder.none,
              errorText: field.errorText,
              contentPadding: EdgeInsets.zero,
            ),
            child: Parent(
              style: ParentStyle()
                ..border(
                  all: 1,
                  color: field.hasError
                      ? Colors.red
                      : Theme.of(context).primaryColor,
                )
                ..padding(horizontal: 15)
                ..height(50)
                ..opacity(enabled ? 1 : .5)
                ..borderRadius(all: 8)
                ..ripple(true),
              gesture: Gestures()
                ..onTap(() async {
                  Helpers.dismissFauces(context);
                  if (!enabled) return;
                  final date = await showDatePicker(
                    context: context,
                    initialDate: field.value ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: lastDate ?? DateTime(2400),
                  );
                  if (date == null) return;
                  field.didChange(date);
                }),
              child: Row(
                children: [
                  Expanded(
                    child: field.value == null
                        ? const Text('Select Date')
                        : Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: '${prefix ?? ''} ',
                                    children: [
                                      TextSpan(
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text: DateFormat(
                                          'EEEE yyyy/MM/dd',
                                        ).format(field.value!),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
