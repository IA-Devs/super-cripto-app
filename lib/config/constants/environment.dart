import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String coinMarketApiKey =
      dotenv.env['COINMARKET_API_KEY'] ?? 'NO API KEY FOUNDED';
  static String defaultLocale = 'es';
  static String superCriptoApiUrl = dotenv.env['SUPER_CRIPTO_API_URL'] ?? 'NO API URL FOUNDED';
}
