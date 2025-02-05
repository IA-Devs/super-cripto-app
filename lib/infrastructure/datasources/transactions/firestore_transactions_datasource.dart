import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:super_cripto_app/config/constants/environment.dart';
import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/infrastructure/mappers/transactions_mapper.dart';
import 'package:super_cripto_app/infrastructure/models/sc_add_transaction.dart';
import 'package:super_cripto_app/infrastructure/models/sct_transaction.dart';

class FirestoreTransactionsDatasource extends TransactionsDatasource {
  final transactionsCollectionsRef =
      FirebaseFirestore.instance.collection('super_cripto_transactions');

  final dio = Dio(BaseOptions(
    baseUrl: Environment.superCriptoApiUrl,
    // connectTimeout: const Duration(seconds: 5),
    //  receiveTimeout: const Duration(seconds: 3),
  ));

  @override
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(
      String userId,
      {int page = 0,
      int limit = 10,
      SuperCriptoTransaction? lastTransaction}) async {
    try {
      final int count = (await transactionsCollectionsRef
                  .where('sct_acc_id', isEqualTo: userId.toString())
                  .count()
                  .get())
              .count ??
          0;
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

  @override
  Future<void> addTransaction(
      {required String accountId,
      required double amount,
      required TransactionType transactionType,
      required String origin,
      required String destination}) async {
    final data = ScAddTransaction(
        sctOrigin: origin,
        sctDestination: destination,
        sctAmount: amount,
        sctType: transactionType.value,
        sctAccId: accountId).toJson();

    return dio
        .post<void>('/add-transaction', data: data, options: Options(contentType: Headers.jsonContentType))
        .then(
          (_) {},
        )
        .catchError((err) {
      print(err);
    });
  }
}
