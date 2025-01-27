import 'package:super_cripto_app/domain/datasources/accounts_datasource.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final AccountsDatasource accountsDatasource;

  AccountsRepositoryImpl({required this.accountsDatasource});

  @override
  Stream<List<AccountInfo>> fetchAccountInfo(String userId) {
    return accountsDatasource.fetchAccountInfo(userId);
  }
}
