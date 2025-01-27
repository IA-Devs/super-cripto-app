import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:super_cripto_app/domain/datasources/accounts_datasource.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/infrastructure/mappers/accounts_mapper.dart';
import 'package:super_cripto_app/infrastructure/models/sc_account.dart';

class FirestoreAccountsDatasource extends AccountsDatasource {
  final accountsCollectionRef =
      FirebaseFirestore.instance.collection('super_cripto_accounts');
  @override
  Stream<List<AccountInfo>> fetchAccountInfo(String userId) {
    return accountsCollectionRef.snapshots().map((e) {
      return e.docs
          .map((e) => AccountsMapper.toAccountInfo(ScAccount.fromJson(e.data())))
          .toList();
    });
  }
}
