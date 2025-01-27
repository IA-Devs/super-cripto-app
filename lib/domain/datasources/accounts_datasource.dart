import 'package:super_cripto_app/domain/entities/account_info.dart';

abstract class AccountsDatasource {
  Stream<List<AccountInfo>> fetchAccountInfo(String userId);
}