import 'package:flutter/material.dart';
import 'package:super_cripto_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountSummary(),
        SizedBox(
          height: 40,
        ),
        AccountLastTransactions()
      ],
    );
  }
}
