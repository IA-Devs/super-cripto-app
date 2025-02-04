import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/config/utils/injections.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/domain/usecases/get_transactions_usecase.dart';
import 'package:super_cripto_app/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:super_cripto_app/presentation/widgets/widgets.dart';

class AccountLastTransactions extends StatefulWidget {
  final VoidCallback? loadNextPage;
  const AccountLastTransactions({
    super.key,
    this.loadNextPage,
  });

  @override
  State<AccountLastTransactions> createState() =>
      _AccountLastTransactionsState();
}

class _AccountLastTransactionsState extends State<AccountLastTransactions> {
  final TransactionsBloc _postBloc =
      TransactionsBloc(transactionsUseCase: sl<GetTransactionsUseCase>());

  final scrollController = ScrollController();

  bool _onScrollEnd(
      ScrollEndNotification scrollEnd, SuperCriptoTransaction lastTransaction) {
    final metrics = scrollEnd.metrics;
    if (metrics.atEdge) {
      bool isTop = metrics.pixels == 0;
      if (!isTop) {
        _postBloc.add(
            OnGettingTransactionsEvent('69573421-5951-490a-9acc-bec8f3bc9755', lastTransaction: lastTransaction));
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _postBloc.add(OnGettingTransactionsEvent('69573421-5951-490a-9acc-bec8f3bc9755'));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<TransactionsBloc, TransactionsState>(
      bloc: _postBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 0.0,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations!.account_last_transactions_title,
                style: textTheme.headlineSmall,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is TransactionsLoadingState)
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    )),
                  if (state is TransactionsEmptyState)
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        localizations.account_last_transactions_empty,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    )),
                  if (state is TransactionsErrorState)
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        localizations.account_last_transactions_error,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    )),
                  if (state is TransactionsLoadedState)
                    SizedBox(
                      height: 450,
                      child: NotificationListener<ScrollEndNotification>(
                          onNotification: (notification) {
                            final lastTransaction = state.transactions.last;
                            return _onScrollEnd(notification, lastTransaction);
                          },
                          child: _TransactionsListView(
                            state: state,
                          )),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TransactionsListView extends StatelessWidget {
  final TransactionsLoadedState state;
  const _TransactionsListView({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: state.hasReachedMax
          ? state.transactions.length
          : state.transactions.length + 1,
      itemBuilder: (context, index) {
        if (index == state.transactions.length && !state.hasReachedMax) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ));
        }

        final transaction = state.transactions[index];

        return TransactionItem(transaction: transaction);
      },
    );
  }
}
