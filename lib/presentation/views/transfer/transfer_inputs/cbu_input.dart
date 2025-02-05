import 'package:formz/formz.dart';

// Define input validation errors
enum CbuInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class CbuInput extends FormzInput<String, CbuInputError> {
  // Call super.pure to represent an unmodified form input.
  const CbuInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const CbuInput.dirty({required String value}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CbuInputError.empty) {
      return 'El campo es requerido';
    }

    if (displayError == CbuInputError.length) {
      return 'Minimo 6 caracteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CbuInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CbuInputError.empty;

    if (value.length < 6) return CbuInputError.length;

    return null;
  }
}
