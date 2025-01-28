import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/presentation/widgets/transfer/numeric_keypad.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TransferView();
  }
}

class _TransferView extends StatefulWidget {
  const _TransferView();

  @override
  State<_TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<_TransferView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Expanded(
            //   child: Center(
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 16),
            //       child: TextField(
            // controller: _controller,
            // autofocus: true,
            // showCursor: true,
            // keyboardType: TextInputType.none,
            // decoration: InputDecoration(
            //     filled: true, fillColor: colors.surface),
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _controller,
                    autofocus: true,
                    showCursor: false,
                    keyboardType: TextInputType.number,

                    //style: TextStyle(),
                    decoration:
                        InputDecoration(filled: true, fillColor: colors.surface, hintText: 'Amount (USD)', labelText: 'Amount (USD)', ),
                  ),
                )),

            Expanded(
              flex: 2,
              child: NumericKeyPad(
                onInputNumber: inputNumber,
                onClearLastInput: clearLastInput,
                onClearAll: clearAll,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
