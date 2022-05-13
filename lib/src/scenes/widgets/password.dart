import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError?> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final minLength = 6;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isNotEmpty) {
      return value.length >= minLength ? null : PasswordValidationError.invalid;
    }
    return PasswordValidationError.empty;
  }
}
