import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String coinMarketApiKey =
      dotenv.env['COINMARKET_API_KEY'] ?? 'NO API KEY FOUNDED';
  static String defaultLocale = 'es';
}
