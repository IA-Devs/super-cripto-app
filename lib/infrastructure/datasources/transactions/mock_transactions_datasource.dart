import 'package:flutter/material.dart';
import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/entities/account.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

class MockTransactionsDatasource extends TransactionsDatasource {
  @override
  Future<Pageable<SuperCriptoTransaction>> fetchTransactionsByUserId(String userId,
      {int page = 0,
      int limit = 10,
      SuperCriptoTransaction? lastTransaction}) async {
    await Future.delayed(const Duration(seconds: 1));

    return Pageable(items: [
      SuperCriptoTransaction(
        '1200',
        origin: Account(id: '1234'),
        destination: Account(id: '4455'),
        amount: 100.0,
        transactionStatus: TransactionStatus.pending,
        transactionType: TransactionType.deposit,
        dueDate: DateTime.now(),
        createdAt: DateTime.now(),
        accountId: '1',
      ),
      SuperCriptoTransaction('1201',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 1200.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.exchange,
          createdAt: DateTime.now(),
          accountId: '1',
          dueDate: DateTime.now()),
      SuperCriptoTransaction('1202',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 35.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.deposit,
          createdAt: DateTime.now(),
          accountId: '1',
          dueDate: DateTime.now()),
      SuperCriptoTransaction('1203',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 665.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.deposit,
          createdAt: DateTime.now(),
          accountId: '1',
          dueDate: DateTime.now()),
      SuperCriptoTransaction('1204',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 21.0,
          transactionStatus: TransactionStatus.success,
          transactionType: TransactionType.invest,
          createdAt: DateTime.now(),
          accountId: '1',
          dueDate: DateTime.now()),
      SuperCriptoTransaction('1205',
          origin: Account(id: '1234'),
          destination: Account(id: '4455'),
          amount: 7090.0,
          transactionStatus: TransactionStatus.error,
          transactionType: TransactionType.exchange,
          createdAt: DateTime.now(),
          accountId: '1',
          dueDate: DateTime.now())
    ], page: page, totalPages: 3);
  }

  @override
  Future<void> addTransaction(
      {required String accountId,
      required double amount,
      required TransactionType transactionType,
      required String origin,
      required String destination}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    debugPrint(
        'addTransaction datasource $accountId $amount $transactionType $origin $destination');
  }
}
