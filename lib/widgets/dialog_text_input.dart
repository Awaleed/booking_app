import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DialogTextInput extends StatelessWidget {
  const DialogTextInput({
    Key? key,
    required this.name,
    required this.validator,
    this.textAlign = TextAlign.start,
    this.hint,
    this.enabled,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.suffixText,
    this.prefixText,
    this.borderColor,
    this.margin,
  }) : super(key: key);

  final TextAlign textAlign;
  final String name;
  final String? Function(dynamic) validator;
  final bool? enabled;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? hint;
  final String? suffixText;
  final String? prefixText;
  final Color? borderColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: FormBuilderTextField(
        name: name,
        enabled: enabled ?? true,
        maxLength: maxLength,
        textAlign: textAlign,
        valueTransformer: (value) => value?.toUpperCase(),
        keyboardType: () {
          if (keyboardType != null) {
            return keyboardType;
          } else if (minLines != null || maxLines != null) {
            return TextInputType.multiline;
          }
        }(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            null,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          labelText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xff39EECE),
              width: .5,
            ),
          ),
          hintText: hint,
          prefixText: prefixText,
          suffixIcon: suffixText == null
              ? null
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(suffixText!),
                  ],
                ),
          hintStyle: const TextStyle(fontSize: 14),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 70,
            minHeight: kMinInteractiveDimension,
          ),
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
        ),
        cursorColor: Colors.grey,
      ),
    );
  }
}
