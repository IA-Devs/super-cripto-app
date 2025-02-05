import 'package:money_formatter/money_formatter.dart';

String? moneyFormat(double number) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final MoneyFormatterOutput fo =
      MoneyFormatter(amount: number, settings: MoneyFormatterSettings()).output;

  return fo.symbolOnLeft;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
