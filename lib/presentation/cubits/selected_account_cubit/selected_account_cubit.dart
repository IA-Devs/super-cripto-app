import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';

part 'selected_account_state.dart';

class SelectedAccountCubit extends Cubit<SelectedAccountState> {
  SelectedAccountCubit()
      : super(const SelectedAccountState(null));

  void selectAccount(AccountInfo account) {
    emit(state.copyWith(account: account));
  }
}
