import 'package:super_cripto_app/domain/entities/account.dart';

class SuperCriptoTransaction {
  final String id;
  final Account origin;
  final Account destination;
  final double amount;
  final DateTime? dueDate;
  final DateTime createdAt;
  final TransactionStatus transactionStatus;
  final TransactionType transactionType;
  final String accountId;

  SuperCriptoTransaction(
    this.id, {
    required this.origin,
    required this.destination,
    required this.amount,
    required this.transactionStatus,
    required this.transactionType,
    this.dueDate,
    required this.createdAt,
    required this.accountId,
  });
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

  static TransactionType from(String value) {
    switch (value) {
      case 'deposit':
        return TransactionType.deposit;
      case 'exchange':
        return TransactionType.exchange;
      case 'withdraw':
        return TransactionType.withdraw;
      case 'invest':
        return TransactionType.invest;
      default:
        return TransactionType.deposit;
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

  static TransactionStatus from(String value) {
    switch (value) {
      case 'success':
        return TransactionStatus.success;
      case 'pending':
        return TransactionStatus.pending;
      case 'error':
        return TransactionStatus.error;
      default:
        return TransactionStatus.pending;
    }
  }
}
