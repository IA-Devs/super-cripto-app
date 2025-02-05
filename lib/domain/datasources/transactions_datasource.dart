import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

abstract class TransactionsDatasource {
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(String userId,
      {int page = 0, int limit = 10, SuperCriptoTransaction? lastTransaction});

  Future<void> addTransaction({
    required String accountId,
    required double amount,
    required TransactionType transactionType,
    required String origin,
    required String destination,
  });
}
