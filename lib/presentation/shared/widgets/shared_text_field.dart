import 'package:flutter/material.dart';

class SharedTextField extends StatelessWidget {
  final String label;
  final String value;
  const SharedTextField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
     final textStyles = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyles.labelMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: textStyles.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
