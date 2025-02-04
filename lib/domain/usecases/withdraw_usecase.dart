import 'package:super_cripto_app/config/utils/usecase.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/domain/repositories/transactions_repository.dart';

class WithdrawUseCase extends UseCase<void, WithdrawUseCaseParams> {
  final TransactionsRepository transactionsRepository;

  WithdrawUseCase({required this.transactionsRepository});

  @override
  Future call(params) {
    return transactionsRepository.addTransaction(
      accountId: params.accountId,
      amount: params.amount,
      origin: params.origin,
      destination: params.destination,
      transactionType: TransactionType.withdraw,
    );
  }

  @override
  Stream callAsStream(params) {
    throw UnimplementedError();
  }
}

class WithdrawUseCaseParams {
  final String accountId;
  final double amount;
  final String origin;
  final String destination;

  WithdrawUseCaseParams(
      {required this.accountId,
      required this.amount,
      required this.destination,
      required this.origin,});
}
