import 'package:formz/formz.dart';

// Define input validation errors
enum AmountInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class AmountInput extends FormzInput<String, AmountInputError> {
  // Call super.pure to represent an unmodified form input.
  const AmountInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const AmountInput.dirty({required String value}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == AmountInputError.empty) {
      return 'El campo es requerido';
    }

    // if (displayError == AmountInputError.length) {
    //   return 'Minimo 6 caracteres';
    // }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  AmountInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return AmountInputError.empty;

    if (value.length < 6) return AmountInputError.length;

    return null;
  }
}
