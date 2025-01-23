import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/domain/usecases/get_transactions_usecase.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactionsUseCase transactionsUseCase;

  TransactionsBloc({required this.transactionsUseCase})
      : super(TransactionsInitial()) {
    on<OnGettingTransactionsEvent>(
        (event, emit) => _onGettingTransactionsEvent(event, emit));
  }

  _onGettingTransactionsEvent(
      OnGettingTransactionsEvent event, Emitter<TransactionsState> emit) async {
    try {
      //print(emitter);

      if (state is TransactionsLoadingState) {
        return;
      }

      if (state is TransactionsInitial) {
        emit(TransactionsLoadingState());

        final result = await transactionsUseCase.call(
          GetTransactionsUseCaseParams(userId: event.userId, page: 0),
        );

        emit(TransactionsLoadedState(
            transactions: result.items, hasReachedMax: false, page: 0));
        return;
      }

      if (state is TransactionsLoadedState) {
        final currentState = state as TransactionsLoadedState;

        if (currentState.hasReachedMax) return;

        final int page = currentState.page + 1;

        //emit(TransactionsLoadingState());

        final result = await transactionsUseCase.call(
          GetTransactionsUseCaseParams(
              userId: event.userId, page: currentState.page + 1),
        );

        final bool hasReachedMax = result.page == result.totalPages - 1;
        final transactions = [...currentState.transactions, ...result.items];

        emit(currentState.copyWith(
            page: page,
            hasReachedMax: hasReachedMax,
            transactions: transactions));
        return;
      }
    } catch (_) {
      // yield PostError();
    }

    // final result = await transactionsUseCase.call(
    //   GetTransactionsUseCaseParams(userId: event.userId, page: event.page),
    // );

    // emit(TransactionsLoadedState(
    //     transactions: result.items, hasReachedMax: false, page: 0));
  }

  bool _hasReachedMax(TransactionsState state) =>
      state is TransactionsLoadedState && state.hasReachedMax;
}
