import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/presentation/cubits/transfer_form/transfer_form_cubit.dart';
import 'package:super_cripto_app/presentation/views/transfer/select_amount_view.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transfer'),
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (context) => TransferFormCubit(),
            child: const SelectAmountView(),
          ),
        ));
  }
}
