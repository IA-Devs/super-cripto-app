import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

abstract class TransactionsDatasource {
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(int userId,
      {int page = 0, int limit = 10, SuperCriptoTransaction? lastTransaction});
}
