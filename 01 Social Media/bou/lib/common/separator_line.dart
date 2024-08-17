import 'package:flutter/material.dart';

class SeparatorLineWidget extends StatelessWidget {
  const SeparatorLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: const Color.fromARGB(237, 237, 237, 237),
      margin: const EdgeInsets.symmetric(vertical: 1.0),
    );
  }
}
