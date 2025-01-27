part of 'accounts_bloc.dart';

class AccountsState extends Equatable {
  final Stream<List<AccountInfo>> accounts;

  const AccountsState({required this.accounts});

  @override
  List<Object> get props => [];

  AccountsState copyWith(Stream<List<AccountInfo>>? accounts) {
    return AccountsState(accounts: accounts ?? this.accounts);
  }
}

final class AccountsInitial extends AccountsState {
  const AccountsInitial({required super.accounts});
}

final class AccountsLoading extends AccountsState {
  const AccountsLoading({required super.accounts});
}

final class AccountsError extends AccountsState {
  const AccountsError({required super.accounts});
}

final class AccountsLoaded extends AccountsState {
  const AccountsLoaded({required super.accounts});
}
