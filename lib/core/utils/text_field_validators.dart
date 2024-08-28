import 'package:equatable/equatable.dart';
import 'package:udrive/core/constants/string_constant.dart';

class TextFieldValidatorEntity extends Equatable {
  final bool Function(String) isValid;
  final String message;
  const TextFieldValidatorEntity({
    required this.isValid,
    required this.message,
  });
  @override
  List<Object?> get props => [
        isValid,
        message,
      ];
}

TextFieldValidatorEntity nameValidator = TextFieldValidatorEntity(
    isValid: (String val) => RegExp(r"^[a-zA-Z.\-'\s]+$").hasMatch(val),
    message: 'Please enter a valid name');

TextFieldValidatorEntity charactersLengthValidator(int length) => TextFieldValidatorEntity(
    isValid: (String val) => val.length >= length, message: 'Minimum length is $length characters');

TextFieldValidatorEntity containsLowercaseValidator = TextFieldValidatorEntity(
    isValid: (String val) => val.contains(RegExp(r'[a-z]')), message: msgNeedsLowerCase);

TextFieldValidatorEntity containsUppercaseValidator = TextFieldValidatorEntity(
    isValid: (String val) => val.contains(RegExp(r'[A-Z]')), message: msgNeedsUpperCase);

TextFieldValidatorEntity containsNumericValidator = TextFieldValidatorEntity(
    isValid: (String val) => val.contains(RegExp(r'[0-9]')), message: msgNeedsNumeric);

TextFieldValidatorEntity containsCharacterValidator = TextFieldValidatorEntity(
    isValid: (String val) => val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
    message: msgNeedsSpecialChar);

TextFieldValidatorEntity notContainWhiteSpace = TextFieldValidatorEntity(
    isValid: (String val) => !val.contains(' '), message: 'This field can’t contain a blank space');
