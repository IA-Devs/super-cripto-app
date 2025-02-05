import 'package:flutter/material.dart';

/// A widget that builds a numeric keypad which
/// mimics the Os numeric keypad on Android and IOS devices
/// or other touch-enabled devices.
class NumericKeyPad extends StatelessWidget {
  /// Creates a widget that builds the numeric keypad.
  const NumericKeyPad({
    super.key,
    required this.onInputNumber,
    required this.onClearLastInput,
    required this.onClearAll,
  });

  final ValueSetter<int> onInputNumber;
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int j = 1; j < 4; j++)
                  Expanded(
                    child: Numeral(
                      number: (i - 1) * 3 + j,
                      onKeyPress: () => onInputNumber((i - 1) * 3 + j),
                    ),
                  ),
              ],
            ),
          ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Expanded(
                  child: Numeral(
                number: 0,
                onKeyPress: () => onInputNumber(0),
              )),
              Expanded(
                child: ClearButton(
                  onClearLastInput: onClearLastInput,
                  onClearAll: onClearAll,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Represents a button on the numeric keypad that contains a number.
class Numeral extends StatelessWidget {
  /// Creates a button on the numeric keypad that contains a number.
  const Numeral({
    super.key,
    required this.number,
    required this.onKeyPress,
  });

  final int number;
  final VoidCallback onKeyPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextButton(onPressed: onKeyPress, child: Text('$number')),

    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onClearLastInput,
    required this.onClearAll,
  });

  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onLongPress: onClearAll,
      child: IconButton(
        onPressed: onClearLastInput,
        icon: Icon(
          Icons.backspace,
          color: colors.primary,
        ),
      ),
    );
  }
}