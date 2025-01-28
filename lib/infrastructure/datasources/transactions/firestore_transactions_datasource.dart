import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/infrastructure/mappers/transactions_mapper.dart';
import 'package:super_cripto_app/infrastructure/models/sct_transaction.dart';

class FirestoreTransactionsDatasource extends TransactionsDatasource {
  final transactionsCollectionsRef =
      FirebaseFirestore.instance.collection('super_cripto_transactions');


  @override
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(int userId,
      {int page = 0,
      int limit = 10,
      SuperCriptoTransaction? lastTransaction}) async {
    try {
      final int count =
          (await transactionsCollectionsRef.where('sct_acc_id', isEqualTo: userId.toString()).count().get()).count ?? 0;
      final int totalPages = ((count + limit - 1) / limit).toInt();

      if (lastTransaction == null) {
        final snapshot = await transactionsCollectionsRef
            .where('sct_acc_id', isEqualTo: userId.toString())
            .orderBy('sct_id', descending: true)
            .limit(limit)
            .get();

        final items = snapshot.docs
            .map(
              (e) => TransactionsMapper.toSuperCriptoTransaction(
                  SctTransaction.fromJson(e.data())),
            )
            .toList();

        return Pageable(items: items, page: page, totalPages: totalPages);
      }

      final snapshot = await transactionsCollectionsRef
          .where('sct_acc_id', isEqualTo: userId)
          .orderBy('sct_id', descending: true)
          .startAfter([lastTransaction.id])
          .limit(limit)
          .get();

      final items = snapshot.docs
          .map(
            (e) => TransactionsMapper.toSuperCriptoTransaction(
                SctTransaction.fromJson(e.data())),
          )
          .toList();

      return Pageable(items: items, page: page, totalPages: totalPages);
    } catch (e) {
      throw Exception('Error fetching transactions');
    }
  }
}
