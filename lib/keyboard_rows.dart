import 'keyboard_buttons.dart';
import 'package:flutter/material.dart';

class KeyboardRows extends StatelessWidget {
  KeyboardRows({required this.rowsButtons, required this.onTap});

  final List<String> rowsButtons;
  final CallbackButtonTap onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> buttons() {
    return rowsButtons.map((String buttonText) {
      return KeyboardButtons(
        buttons: buttonText,
        onTap: onTap,
      );
    }).toList();
  }
}
