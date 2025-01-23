import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/entities/account.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

class MockTransactionsDatasource extends TransactionsDatasource {
  @override
  Future<Pageable<Transaction>> fetchTransactionsByUserId(int userId,
      {int page = 0, int limit = 10}) async {
    await Future.delayed(const Duration(seconds: 3));

    return Pageable(items: [
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
    ], page: page, totalPages: 3);
  }
}
