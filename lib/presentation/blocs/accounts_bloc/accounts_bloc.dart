import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAccountInfoUseCase getAccountInfoUseCase;

  final streamController = StreamController<List<AccountInfo>>.broadcast();

  AccountsBloc({required this.getAccountInfoUseCase})
      : super(const AccountsInitial(accounts: Stream.empty())) {
    on<OnFetchAccounts>(_onFetchAccounts);
  }

  FutureOr<void> _onFetchAccounts(
      OnFetchAccounts event, Emitter<AccountsState> emit) async {
    if (state is AccountsInitial) {
      emit(AccountsLoading(accounts: state.accounts));

      final accounts = getAccountInfoUseCase
          .callAsStream(GetAccountInfoUseCaseParams(userId: event.userId));

      await emit.forEach(
        accounts,
        onData: (data) {
          streamController.sink.add(data);
          return AccountsLoaded(accounts: accounts);
        },
      );
    }
  }
}
