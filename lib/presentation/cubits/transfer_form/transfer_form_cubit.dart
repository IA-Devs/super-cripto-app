import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:super_cripto_app/domain/usecases/withdraw_usecase.dart';
import 'package:super_cripto_app/presentation/views/transfer/transfer_inputs/amount_input.dart';
import 'package:super_cripto_app/presentation/views/transfer/transfer_inputs/cbu_input.dart';

part 'transfer_form_state.dart';

class TransferFormCubit extends Cubit<TransferFormState> {
  final WithdrawUseCase withdrawUseCase;
  TransferFormCubit({required this.withdrawUseCase})
      : super(const TransferFormState());

  Future<void> onSubmit(
      {required String accountId,
      required double amount,
      required String destination,
      required String origin}) async {

    return withdrawUseCase.call(WithdrawUseCaseParams(
        accountId: accountId,
        amount: amount,
        destination: destination,
        origin: origin));

    // emit(state.copyWith(
    //     formStatus: FormStatus.validating,
    //     amount: AmountInput.dirty(value: state.amount.value),
    //     cbu: CbuInput.dirty(value: state.cbu.value),
    //     isValid: Formz.validate([state.cbu, state.amount])));
  }

  void amountChanged(String value) {
    final amount = AmountInput.dirty(value: value);
    emit(state.copyWith(
        amount: amount, isValid: Formz.validate([state.cbu, amount])));
  }

  void cbuChanged(String value) {
    final cbu = CbuInput.dirty(value: value);
    emit(
        state.copyWith(cbu: cbu, isValid: Formz.validate([state.amount, cbu])));
  }
}
