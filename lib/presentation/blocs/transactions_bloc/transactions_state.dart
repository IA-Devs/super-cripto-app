part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsState extends Equatable {}

final class TransactionsInitial extends TransactionsState {
  @override
  List<Object?> get props => [];
}

class TransactionsLoadingState extends TransactionsState {
  @override
  List<Object?> get props => [];
}

// Error On Getting Ny Times State
class TransactionsErrorState extends TransactionsState {
  final String errorMsg;

  TransactionsErrorState(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}

// Success Get Ny Times State
class TransactionsLoadedState extends TransactionsState {
  final int page;
  final bool hasReachedMax;
  final List<SuperCriptoTransaction> transactions;

  TransactionsLoadedState(
      {required this.hasReachedMax,
      required this.transactions,
      required this.page})
      : super();

  TransactionsLoadedState copyWith(
      {int? page,
      bool? hasReachedMax,
      List<SuperCriptoTransaction>? transactions}) {
    return TransactionsLoadedState(
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        transactions: transactions ?? this.transactions,
        page: page ?? this.page);
  }

  @override
  List<Object?> get props => [page, hasReachedMax, transactions];
}
