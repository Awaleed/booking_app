import 'package:validators/validators.dart';

abstract class Validators {
  static String? notEmptyStringValidator(dynamic value) {
    if (value is String?) {
      if ((value ?? '').isEmpty) {
        return 'Must not be empty';
      }
      return null;
    }
    throw UnsupportedError('value $value');
  }

  static String? shortStringValidator(dynamic value) {
    if (value is String?) {
      if (value == null || value.length < 3) {
        return 'Should be more than 3 letters';
      }
      return null;
    }
    throw UnsupportedError('value $value');
  }

  static String? emptyOrShortStringValidator(dynamic value) {
    if (value == null) return null;

    if (value is String?) {
      if (value == null || value.isEmpty) {
        return null;
      } else if (value.isNotEmpty && value.length < 3) {
        return 'Should be more than 3 letters';
      }
      return null;
    }
    throw UnsupportedError('value $value');
  }

  static String? longStringValidator(dynamic value) {
    if (value is String?) {
      if (value == null || value.length < 6) {
        return 'Should be more than 6 letters';
      }
      return null;
    }
    throw UnsupportedError('value $value');
  }

  static String? nullOrStringValidator(dynamic value) {
    if (value == null) return null;
    if (value is String && value.isEmpty) return null;
    return notEmptyStringValidator(value);
  }

  static String? notNullValidator(dynamic value) {
    if (value == null) {
      return 'Please choose one';
    }
    return null;
  }

  static String? numericValidator(dynamic value) {
    if (value is num) {
      return null;
    } else if (value is String) {
      if (!isNumeric(value) || value.isEmpty) {
        return 'Enter a valid number';
      }
      return null;
    } else if (value == null) {
      return 'Enter a valid number';
    }
    throw UnsupportedError('value $value');
  }
}
