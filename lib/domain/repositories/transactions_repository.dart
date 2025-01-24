import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

abstract class TransactionsRepository {
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(int userId,
      {int page = 0, SuperCriptoTransaction? lastTransaction});
}
