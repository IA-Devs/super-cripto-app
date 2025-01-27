part of 'accounts_bloc.dart';

sealed class AccountsEvent extends Equatable {
  const AccountsEvent();

  @override
  List<Object> get props => [];
}

class OnFetchAccounts extends AccountsEvent {
  final String userId;

  const OnFetchAccounts({required this.userId});
}
