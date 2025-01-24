import 'package:super_cripto_app/config/utils/pageable.dart';
import 'package:super_cripto_app/config/utils/usecase.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/domain/repositories/transactions_repository.dart';

class GetTransactionsUseCase extends UseCase<Pageable<SuperCriptoTransaction>,
    GetTransactionsUseCaseParams> {
  final TransactionsRepository transactionsRepository;

  GetTransactionsUseCase({required this.transactionsRepository});

  @override
  Future<Pageable<SuperCriptoTransaction>> call(
      GetTransactionsUseCaseParams params) {
    return transactionsRepository.fetchTransactionsByUserId(params.userId,
        page: params.page);
  }
}

class GetTransactionsUseCaseParams {
  int page;
  int userId;
  SuperCriptoTransaction? lastTransaction;

  GetTransactionsUseCaseParams(
      {required this.userId, this.page = 0, this.lastTransaction});
}
