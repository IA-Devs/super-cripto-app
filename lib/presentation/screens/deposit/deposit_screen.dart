import 'package:flutter/material.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
      ),
      body: const Center(
        child: Text('Deposit Screen'),
      ),
    );
  }
}