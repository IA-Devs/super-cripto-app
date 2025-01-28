import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_cripto_app/domain/datasources/accounts_datasource.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';

class MockAccountsDatasource extends AccountsDatasource {
  final _random = Random();

  @override
  Stream<List<AccountInfo>> fetchAccountInfo(String userId) {
    final accounts = [
      AccountInfo(
          balance: _random.nextInt(8000) + 200,
          id: '1',
          firstname: 'Daniel',
          lastname: 'Arza',
          userId: userId,
          accountAlias: 'TRIANGULO.JIRAFA.PIZZA',
          accountNumber: '2166055311100023016874',
          bankName: 'Banco Santander')
    ];
    // return Stream.periodic(const Duration(seconds: 5)).asyncMap((event) =>
    // accounts
    // //);
    //return StreamBuilder(stream: stream, builder: builder)
    final stream = Stream<List<AccountInfo>>.fromIterable([accounts]);
    return stream;
  }
}
