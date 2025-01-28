part of 'selected_account_cubit.dart';

class SelectedAccountState extends Equatable {
  final AccountInfo account;
  const SelectedAccountState(this.account);

  @override
  List<Object> get props => [account];

  SelectedAccountState copyWith({AccountInfo? account}){
    return SelectedAccountState(account ?? this.account);
  }
}
