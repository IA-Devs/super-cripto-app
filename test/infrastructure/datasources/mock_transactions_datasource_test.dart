import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';
import 'package:super_cripto_app/infrastructure/datasources/transactions/mock_transactions_datasource.dart';

@GenerateMocks([MockTransactionsDatasource])
void main() {
  late final mockTransactionsDatasource;
  group('MockTransactionsDatasource', () {
    setUp(
      () {
        mockTransactionsDatasource = MockTransactionsDatasource();
      },
    );
    test('fetchTransactionsByUserId', () async {
      when(mockTransactionsDatasource.fetchTransactionsByUserId(1, page: 0))
          .thenAnswer((_) async => []);
      var result;
      try {
        result = await mockTransactionsDatasource.fetchTransactionsByUserId(1,
            page: 0);
      } catch (e) {
        print('fetchTransactionsByUserId error ${e.toString()}');
        result = e;
      }
      expect(result, emptyTransactions);
      // Arrange
      // Act
      // Assert
    });
  });
}

List<SuperCriptoTransaction> emptyTransactions = [];
