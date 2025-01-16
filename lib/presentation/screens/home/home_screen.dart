import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home_title),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.home_body_label),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var snackBar = SnackBar(
            content: Text(Environment.coinMarketApiKey),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
