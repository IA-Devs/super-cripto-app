import 'dart:math';

import 'package:super_cripto_app/domain/datasources/accounts_datasource.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';

class MockAccountsDatasource extends AccountsDatasource {
  final _random = Random();

  @override
  Stream<List<AccountInfo>> fetchAccountInfo(String userId) {
    return Stream.periodic(const Duration(seconds: 5)).asyncMap((event) => [
          AccountInfo(
              balance: _random.nextInt(8000) + 200,
              id: '1',
              firstname: 'Daniel',
              lastname: 'Arza',
              userId: userId)
        ]);
  }
}
