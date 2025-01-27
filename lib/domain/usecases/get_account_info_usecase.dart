import 'package:super_cripto_app/config/utils/usecase.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/domain/repositories/accounts_repository.dart';

class GetAccountInfoUseCase
    extends UseCase<List<AccountInfo>, GetAccountInfoUseCaseParams> {
  final AccountsRepository accountsRepository;

  GetAccountInfoUseCase({required this.accountsRepository});

  @override
  Future<List<AccountInfo>> call(GetAccountInfoUseCaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Stream<List<AccountInfo>> callAsStream(GetAccountInfoUseCaseParams params) {
    return accountsRepository.fetchAccountInfo(params.userId);
  }
}

class GetAccountInfoUseCaseParams {
  String userId;

  GetAccountInfoUseCaseParams({
    required this.userId,
  });
}
