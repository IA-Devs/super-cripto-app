import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/infrastructure/models/sc_account.dart';

class AccountsMapper {
  static AccountInfo toAccountInfo(ScAccount scAccount) => AccountInfo(
      balance: scAccount.scAccAvailableBalance,
      id: scAccount.scAccId,
      firstname: scAccount.scAccFirstName,
      lastname: scAccount.scAccLastName,
      userId: scAccount.scAccId);
}
