import 'package:flutter/material.dart';
import 'package:super_cripto_app/config/constants/environment.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/presentation/widgets/home/account_last_transactions.dart';
import 'package:super_cripto_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(AppLocalizations.of(context)!.home_title),
      // ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountSummary(
          accountInfo: AccountInfo(balance: 5981),
        ),
        const SizedBox(
          height: 40,
        ),
        const AccountLastTransactions()
      ],
    );
  }
}
