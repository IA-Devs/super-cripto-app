import 'package:flutter/material.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

IconData getTransactionIcon(SuperCriptoTransaction transaction) {
  switch (transaction.transactionType) {
    case TransactionType.deposit:
      return Icons.arrow_downward_outlined;
    case TransactionType.exchange:
      return Icons.currency_exchange_outlined;
    case TransactionType.withdraw:
      return Icons.arrow_outward_outlined;
    case TransactionType.invest:
      return Icons.show_chart_outlined;
  }
}
