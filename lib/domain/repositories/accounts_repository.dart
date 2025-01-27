import 'package:super_cripto_app/domain/entities/account_info.dart';

abstract class AccountsRepository {
  Stream<List<AccountInfo>> fetchAccountInfo(String userId);
}
