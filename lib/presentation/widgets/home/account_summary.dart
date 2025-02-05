import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:super_cripto_app/config/utils/injections.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';
import 'package:super_cripto_app/presentation/blocs/blocs.dart';
import 'package:super_cripto_app/presentation/cubits/selected_account_cubit/selected_account_cubit.dart';

class AccountSummary extends StatefulWidget {

  const AccountSummary({super.key});

  @override
  State<AccountSummary> createState() => _AccountSummaryState();
}

class _AccountSummaryState extends State<AccountSummary> {
  List<AccountInfo> accounts = [];

  final _accountsBloc =
      AccountsBloc(getAccountInfoUseCase: sl<GetAccountInfoUseCase>());

  late final StreamSubscription<List<AccountInfo>>? streamSubscription;

  void selectAccount(BuildContext context, AccountInfo account) {
    context.read<SelectedAccountCubit>().selectAccount(account);
  }

  void listenAccountsInfo(BuildContext context) {
    streamSubscription = _accountsBloc.streamController.stream.listen((event) {
      accounts = event;
      if(accounts.isNotEmpty && context.mounted) {
        selectAccount(context, accounts[0]);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    listenAccountsInfo(context);
    _accountsBloc.add(const OnFetchAccounts(userId: '69573421-5951-490a-9acc-bec8f3bc9755'));
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  String getBalance(double balance) {
    try {
      if (accounts.isEmpty) return '';

      final MoneyFormatterOutput fo =
          MoneyFormatter(amount: balance, settings: MoneyFormatterSettings())
              .output;

      return fo.symbolOnLeft;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 350,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.secondary,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 8))
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)),
        ),
        child: Center(
          child: BlocBuilder<AccountsBloc, AccountsState>(
            bloc: _accountsBloc,
            builder: (context, state) {
              if (state is AccountsError) {
                return Text(localizations.account_summary_error);
              }

              if (state is AccountsLoading) {
                return const CircularProgressIndicator();
              }

              if (state is AccountsLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localizations.account_summary_balance,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      accounts.isEmpty ? '' : getBalance(accounts[0].balance),
                      style: textTheme.headlineLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.go('/deposit');
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_downward_outlined),
                            ),
                            Text(localizations.account_summary_deposit,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => context.go('/transfer'),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_outward_outlined),
                            ),
                            Text(localizations.account_summary_send,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //TODO: implementar acción
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child:
                                  const Icon(Icons.currency_exchange_outlined),
                            ),
                            Text(localizations.account_summary_exchange,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //TODO: implementar acción
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.show_chart_outlined),
                            ),
                            Text(localizations.account_summary_earn,
                                style: const TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    )
                  ],
                );
              }

              return const Text('');
            },
          ),
        ),
      ),
    );
  }
}
