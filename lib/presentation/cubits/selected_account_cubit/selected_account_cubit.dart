import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';

part 'selected_account_state.dart';

class SelectedAccountCubit extends Cubit<SelectedAccountState> {
  SelectedAccountCubit()
      : super(SelectedAccountState(AccountInfo(
            balance: 0.0,
            id: '',
            firstname: '',
            lastname: '',
            userId: '',
            accountNumber: '',
            accountAlias: '',
            bankName: '')));

  void selectAccount(AccountInfo account) {
    emit(state.copyWith(account: account));
  }
}
