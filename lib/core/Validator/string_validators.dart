import 'package:flutter/services.dart';

abstract class StringValidator {
  bool isValid(String value);
}

abstract class StringTextInputFormatter {
  String formatEditUpdate(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({this.regexSource});
  final Pattern regexSource;

  @override
  bool isValid(String value) {
    try {
      // https://regex101.com/
      final RegExp regex = RegExp(regexSource);
      if (regex.hasMatch(value)) {
        return true;
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({this.editingValidator});
  final StringValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final bool oldValueValid = editingValidator.isValid(oldValue.text);
    final bool newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class RegexOneUpperCase extends RegexValidator {
  RegexOneUpperCase() : super(regexSource: r'[A-Z]');
}

class RegexOneLowerCase extends RegexValidator {
  RegexOneLowerCase() : super(regexSource: r'[a-z]');
}

class RegexOneDigit extends RegexValidator {
  RegexOneDigit() : super(regexSource: r'[0-9]');
}

class RegexOneSpecialCharacter extends RegexValidator {
  RegexOneSpecialCharacter() : super(regexSource: r'[!@#$%^&*(),.?":{}|<>]');
}

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator() : super(regexSource: '^(|\\S)+\$');
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator() : super(regexSource: '^\\S+@\\S+\\.\\S+\$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}

class MaxLengthStringValidator extends StringValidator {
  MaxLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length <= minLength;
  }
}
