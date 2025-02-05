import 'package:get_it/get_it.dart';
import 'package:super_cripto_app/domain/datasources/accounts_datasource.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/repositories/accounts_repository.dart';
import 'package:super_cripto_app/domain/repositories/transactions_repository.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';
import 'package:super_cripto_app/domain/usecases/get_transactions_usecase.dart';
import 'package:super_cripto_app/domain/usecases/withdraw_usecase.dart';
import 'package:super_cripto_app/infrastructure/datasources/accounts/firestore_accounts_datasource.dart';
import 'package:super_cripto_app/infrastructure/datasources/accounts/mock_accounts_datasource.dart';
import 'package:super_cripto_app/infrastructure/datasources/transactions/firestore_transactions_datasource.dart';
import 'package:super_cripto_app/infrastructure/datasources/transactions/mock_transactions_datasource.dart';
import 'package:super_cripto_app/infrastructure/repositories/accounts_repository_impl.dart';
import 'package:super_cripto_app/infrastructure/repositories/transactions_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await _initFirestoreTransactionsInjections();
}

_initCommon() {
  sl.registerSingleton<AccountsRepository>(
      AccountsRepositoryImpl(accountsDatasource: sl<AccountsDatasource>()));
  sl.registerSingleton<GetAccountInfoUseCase>(
      GetAccountInfoUseCase(accountsRepository: sl<AccountsRepository>()));

  sl.registerSingleton<WithdrawUseCase>(
      WithdrawUseCase(transactionsRepository: sl<TransactionsRepository>()));
}

// ignore: unused_element
_initMockTransactionsInjections() {
  sl.registerSingleton<TransactionsDatasource>(MockTransactionsDatasource());
  sl.registerSingleton<TransactionsRepository>(
      TransactionsRepositoryImpl(datasource: sl<TransactionsDatasource>()));
  sl.registerSingleton<GetTransactionsUseCase>(GetTransactionsUseCase(
      transactionsRepository: sl<TransactionsRepository>()));

  sl.registerSingleton<AccountsDatasource>(MockAccountsDatasource());

  _initCommon();
}

_initFirestoreTransactionsInjections() {
  sl.registerSingleton<TransactionsDatasource>(
      FirestoreTransactionsDatasource());
  sl.registerSingleton<TransactionsRepository>(
      TransactionsRepositoryImpl(datasource: sl<TransactionsDatasource>()));
  sl.registerSingleton<GetTransactionsUseCase>(GetTransactionsUseCase(
      transactionsRepository: sl<TransactionsRepository>()));

  sl.registerSingleton<AccountsDatasource>(FirestoreAccountsDatasource());

  _initCommon();
}
