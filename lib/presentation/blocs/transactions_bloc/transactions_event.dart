part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsEvent {}

class OnGettingTransactionsEvent extends TransactionsEvent {
  final String userId;
  final int page;
  final bool withLoading;
  final SuperCriptoTransaction? lastTransaction;

  OnGettingTransactionsEvent(this.userId,
      {this.page = 0, this.withLoading = true, this.lastTransaction});
}

class OnRefreshTransactionsEvent extends TransactionsEvent {
  final String userId;

   OnRefreshTransactionsEvent(this.userId);
}
