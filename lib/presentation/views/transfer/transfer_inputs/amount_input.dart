import 'package:formz/formz.dart';
import 'package:super_cripto_app/config/helper/validations/numbers.dart';

// Define input validation errors
enum AmountInputError { empty, notNumber, zero }

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

    if (displayError == AmountInputError.notNumber) {
      return 'Debe ser un número';
    }

    if (displayError == AmountInputError.zero) {
      return 'Debe ser mayor a 0';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  AmountInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return AmountInputError.empty;

    if (!NumberValidations.isNumeric(value)) {
      return AmountInputError.notNumber;
    }

    if (double.parse(value) <= 0) {
      return AmountInputError.zero;
    }

    return null;
  }
}
