part of 'transfer_form_cubit.dart';

enum FormStatus { invalid, valid, validating }

class TransferFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final CbuInput cbu;
  final AmountInput amount;

  const TransferFormState(
      {this.isValid = false,
      this.formStatus = FormStatus.invalid,
      this.cbu = const CbuInput.pure(),
      this.amount = const AmountInput.pure()});

  TransferFormState copyWith(
      {FormStatus? formStatus,
      bool? isValid,
      CbuInput? cbu,
      AmountInput? amount}) {
    return TransferFormState(
        formStatus: formStatus ?? this.formStatus,
        amount: amount ?? this.amount,
        cbu: cbu ?? this.cbu,
        isValid: isValid ?? this.isValid);
  }

  @override
  List<Object> get props => [formStatus, isValid, cbu, amount];
}
