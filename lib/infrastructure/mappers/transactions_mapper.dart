import 'package:super_cripto_app/domain/entities/account.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/infrastructure/models/sct_transaction.dart';

class TransactionsMapper {
  static SuperCriptoTransaction toSuperCriptoTransaction(
          SctTransaction sctTransaction) =>
      SuperCriptoTransaction(sctTransaction.sctId.toString(),
          origin: Account(id: sctTransaction.sctOrigin),
          destination: Account(id: sctTransaction.sctDestination),
          amount: sctTransaction.sctAmount,
          transactionStatus: TransactionStatusValue.from(sctTransaction.sctStatus),
          transactionType: TransactionTypeValue.from(sctTransaction.sctType),
          dueDate: sctTransaction.sctDueDate,
          createdAt: sctTransaction.sctCreatedAt,
          accountId: sctTransaction.sctAccId );
}
