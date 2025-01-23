part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsEvent {}

class OnFetchTransactionsEvent extends TransactionsEvent {}

class OnFetchMoreTransactionsEvent extends TransactionsEvent {}

class OnGettingTransactionsEvent extends TransactionsEvent {
  final int userId;
  final int page;
  final bool withLoading;

  OnGettingTransactionsEvent(this.userId,
      {this.page = 0, this.withLoading = true});
}
