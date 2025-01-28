import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/presentation/cubits/selected_account_cubit/selected_account_cubit.dart';
import 'package:super_cripto_app/presentation/shared/widgets/shared_text_field.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DepositView();
  }
}

class _DepositView extends StatelessWidget {
  const _DepositView();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.deposit_title),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<SelectedAccountCubit, SelectedAccountState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  SharedTextField(
                    label: 'Account info',
                    value: state.account.accountNumber,
                  ),
                  SharedTextField(
                      label: 'Account beneficiary',
                      value:
                          '${state.account.lastname} ${state.account.firstname}'),
                  SharedTextField(
                      label: 'Bank Name', value: state.account.bankName)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
