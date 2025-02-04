import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final TransactionsDatasource datasource;

  TransactionsRepositoryImpl({required this.datasource});

  @override
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(int userId,
      {int page = 0, int limit = 10, SuperCriptoTransaction? lastTransaction}) {
    return datasource.fetchTransactionsByUserId(userId,
        page: page, limit: limit);
  }

  @override
  Future<void> addTransaction(
      {required String accountId,
      required double amount,
      required TransactionType transactionType,
      required String origin,
      required String destination}) {
    return datasource.addTransaction(
        accountId: accountId,
        amount: amount,
        transactionType: transactionType,
        origin: origin,
        destination: destination);
  }
}
