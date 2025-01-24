import 'package:super_cripto_app/domain/entities/account.dart';

class SuperCriptoTransaction {
  final String id;
  final Account origin;
  final Account destination;
  final double amount;
  final DateTime dueDate;
  final DateTime createdAt;
  final TransactionStatus transactionStatus;
  final TransactionType transactionType;

  SuperCriptoTransaction(this.id,
      {required this.origin,
      required this.destination,
      required this.amount,
      required this.transactionStatus,
      required this.transactionType,
      required this.dueDate,
      required this.createdAt});
}

enum TransactionStatus { pending, success, error }

enum TransactionType { deposit, exchange, withdraw, invest }

extension TransactionTypeValue on TransactionType {
  String get value {
    switch (this) {
      case TransactionType.deposit:
        return 'deposit';
      case TransactionType.exchange:
        return 'exchange';
      case TransactionType.withdraw:
        return 'withdraw';
      case TransactionType.invest:
        return 'invest';
    }
  }
}

extension TransactionStatusValue on TransactionStatus {
  String get value {
    switch (this) {
      case TransactionStatus.success:
        return 'success';
      case TransactionStatus.pending:
        return 'pending';
      case TransactionStatus.error:
        return 'error';
    }
  }
}
