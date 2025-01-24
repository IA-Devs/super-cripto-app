import 'package:get_it/get_it.dart';
import 'package:super_cripto_app/domain/datasources/transactions_datasource.dart';
import 'package:super_cripto_app/domain/repositories/transactions_repository.dart';
import 'package:super_cripto_app/domain/usecases/get_transactions_usecase.dart';
import 'package:super_cripto_app/infrastructure/datasources/firestore_transactions_datasource.dart';
import 'package:super_cripto_app/infrastructure/datasources/mock_transactions_datasource.dart';
import 'package:super_cripto_app/infrastructure/repositories/transactions_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initFirestoreTransactionsInjections();
}

initMockTransactionsInjections() {
  sl.registerSingleton<TransactionsDatasource>(MockTransactionsDatasource());
  sl.registerSingleton<TransactionsRepository>(
      TransactionsRepositoryImpl(datasource: sl<TransactionsDatasource>()));
  sl.registerSingleton<GetTransactionsUseCase>(
      GetTransactionsUseCase(transactionsRepository: sl<TransactionsRepository>()));
}

initFirestoreTransactionsInjections() {
  sl.registerSingleton<TransactionsDatasource>(FirestoreTransactionsDatasource());
  sl.registerSingleton<TransactionsRepository>(
      TransactionsRepositoryImpl(datasource: sl<TransactionsDatasource>()));
  sl.registerSingleton<GetTransactionsUseCase>(
      GetTransactionsUseCase(transactionsRepository: sl<TransactionsRepository>()));
}
