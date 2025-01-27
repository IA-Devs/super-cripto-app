import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:super_cripto_app/domain/entities/account_info.dart';

class AccountSummary extends StatelessWidget {
  final AccountInfo accountInfo;

  const AccountSummary({super.key, required this.accountInfo});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final MoneyFormatterOutput fo =
        MoneyFormatter(amount: accountInfo.balance).output;

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
          //border: Border(bottom: BorderSide(color: colors.secondary))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localizations.account_summary_balance, style: const TextStyle(color: Colors.white),),
              Text(
                fo.symbolOnLeft,
                style: textTheme.headlineLarge!.copyWith(color: Colors.white),
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
                          //TODO: implementar acción
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.arrow_downward_outlined),
                      ),
                      Text(localizations.account_summary_deposit, style: const TextStyle(color: Colors.white))
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
                        child: const Icon(Icons.arrow_outward_outlined),
                      ),
                      Text(localizations.account_summary_send, style: const TextStyle(color: Colors.white))
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
                        child: const Icon(Icons.currency_exchange_outlined),
                      ),
                      Text(localizations.account_summary_exchange, style: const TextStyle(color: Colors.white))
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
                      Text(localizations.account_summary_earn, style: const TextStyle(color: Colors.white))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
