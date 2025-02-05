import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cripto_app/presentation/cubits/selected_account_cubit/selected_account_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/presentation/cubits/transfer_form/transfer_form_cubit.dart';
import 'package:super_cripto_app/presentation/widgets/widgets.dart';

class SelectAmountView extends StatefulWidget {
  const SelectAmountView({super.key});

  @override
  State<SelectAmountView> createState() => _SelectAmountViewState();
}

class _SelectAmountViewState extends State<SelectAmountView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void inputNumber(int value) {
    _controller.text += value.toString();
  }

  void clearLastInput() {
    if (_controller.text.isNotEmpty) {
      _controller.text = _controller.text.substring(
        0,
        _controller.text.length - 1,
      );
    }
  }

  void clearAll() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    final selectedAccountCubit = context.watch<SelectedAccountCubit>();

    final transferCubit = context.watch<TransferFormCubit>();

    final amount = transferCubit.state.amount;

    final cbu = transferCubit.state.cbu;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            autofocus: true,
            showCursor: true,
            keyboardType: TextInputType.text,
            onChanged: transferCubit.cbuChanged,
            decoration: InputDecoration(
                errorText: cbu.errorMessage,
                filled: true,
                fillColor: colors.surface,
                hintText: localizations.select_amount_view_amount_hint,
                labelText: localizations.select_amount_view_amount_label,
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            controller: _controller,
            autofocus: false,
            showCursor: false,
            keyboardType: TextInputType.number,
            onChanged: transferCubit.amountChanged,
            decoration: InputDecoration(
                errorText: amount.errorMessage,
                filled: true,
                fillColor: colors.surface,
                hintText: localizations.select_amount_view_cbu_hint,
                labelText: localizations.select_amount_view_cbu_label,
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          Expanded(
            flex: 2,
            child: NumericKeyPad(
              onInputNumber: inputNumber,
              onClearLastInput: clearLastInput,
              onClearAll: clearAll,
            ),
          ),
          FilledButton(
            onPressed: transferCubit.state.isValid
                ? () async {
                    //  if (!transferCubit.state.isValid) return;

                    startLoading;
                    await transferCubit.onSubmit(
                        accountId: selectedAccountCubit.state.account!.id,
                        amount: double.parse(amount.value),
                        destination: cbu.value,
                        origin:
                            selectedAccountCubit.state.account!.accountAlias);

                    if (context.mounted) context.go('/');
                  }
                : null,
            style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50)),
            child: Text(
              localizations.select_amount_view_submit_label,
            ),
          ),
        ],
      ),
    );
  }
}
