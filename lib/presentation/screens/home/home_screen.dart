import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/config/utils/injections.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';
import 'package:super_cripto_app/presentation/blocs/blocs.dart';
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
    return BlocProvider(
      create: (context) =>
          AccountsBloc(getAccountInfoUseCase: sl<GetAccountInfoUseCase>()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountSummary(
            accountInfo: AccountInfo(
                balance: 5981,
                id: '1',
                firstname: '',
                lastname: '',
                userId: ''),
          ),
          const SizedBox(
            height: 40,
          ),
          const AccountLastTransactions()
        ],
      ),
    );
  }
}
