import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:super_cripto_app/config/constants/environment.dart';
import 'package:super_cripto_app/config/helper/transactions/transaction_icon.dart';
import 'package:super_cripto_app/domain/entities/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  final SuperCriptoTransaction transaction;

  get icon => getTransactionIcon(transaction);

  get dueDate => DateFormat.yMMMEd(Environment.defaultLocale).format(transaction.dueDate);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    final MoneyFormatterOutput fo =
        MoneyFormatter(amount: transaction.amount).output;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            debugPrint('On view list detal');
          },
          child: SizedBox(
            height: 64,
            width: size.width,
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.account_last_transactions_item_title(
                          transaction.transactionType.value),
                      style: textStyles.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(dueDate),
                    Text(
                      localizations.account_last_transactions_item_status(
                          transaction.transactionStatus.value),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  fo.symbolOnLeft,
                  style: textStyles.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
