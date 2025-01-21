import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/domain/entities/account.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/presentation/widgets/widgets.dart';

class AccountLastTransactions extends StatelessWidget {
  const AccountLastTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction(
          id: '1200',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 100.0,
          transactionStatus: TransactionStatus.pending,
          transactionType: TransactionType.deposit,
          dueDate: DateTime.now()),
      Transaction(
          id: '1201',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 1200.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.exchange,
          dueDate: DateTime.now()),
      Transaction(
          id: '1202',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 35.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.deposit,
          dueDate: DateTime.now()),
      Transaction(
          id: '1203',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 665.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.deposit,
          dueDate: DateTime.now()),
      Transaction(
          id: '1204',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 21.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.invest,
          dueDate: DateTime.now()),
      Transaction(
          id: '1205',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 7090.0,
          transactionStatus: TransactionStatus.error,
          transactionType: TransactionType.exchange,
          dueDate: DateTime.now())
    ];

    final localizations = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

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
              SizedBox(
                height: 450,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return TransactionItem(transaction: transaction);
                  },
                ),
              )
            ],
          ),

        ],
      ),
    );

  }
}

