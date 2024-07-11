import 'constants.dart';
import 'package:flutter/material.dart';

typedef void CallbackButtonTap({String buttonText});

class KeyboardButtons extends StatelessWidget {
  KeyboardButtons({required this.buttons, required this.onTap});

  final String buttons;
  final CallbackButtonTap onTap;

  bool _colorTextButtons() {
    return (buttons == DEL_SIGN ||
        buttons == DECIMAL_POINT_SIGN ||
        buttons == CLEAR_ALL_SIGN ||
        buttons == MODULAR_SIGN ||
        buttons == PLUS_SIGN ||
        buttons == MINUS_SIGN ||
        buttons == MULTIPLICATION_SIGN ||
        buttons == DIVISION_SIGN ||
        buttons == EXCHANGE_CALCULATOR ||
        buttons == PI ||
        buttons == SQUARE_ROOT_SIGN ||
        buttons == POWER_SIGN ||
        buttons == LN_SIGN ||
        buttons == LG_SIGN ||
        buttons == SIN_SIGN ||
        buttons == COS_SIGN ||
        buttons == TAN_SIGN ||
        buttons == RAD_SIGN ||
        buttons == DEG_SIGN ||
        buttons == ARCSIN_SIGN ||
        buttons == ARCCOS_SIGN ||
        buttons == ARCTAN_SIGN ||
        buttons == LN2_SIGN ||
        buttons == E_NUM ||
        buttons == LEFT_QUOTE_SIGN ||
        buttons == RIGHT_QUOTE_SIGN);
  }

  bool _fontSize() {
    return (buttons == LN_SIGN ||
        buttons == LG_SIGN ||
        buttons == SIN_SIGN ||
        buttons == COS_SIGN ||
        buttons == TAN_SIGN ||
        buttons == RAD_SIGN ||
        buttons == DEG_SIGN ||
        buttons == ARCSIN_SIGN ||
        buttons == ARCCOS_SIGN ||
        buttons == ARCTAN_SIGN ||
        buttons == LN2_SIGN ||
        buttons == LEFT_QUOTE_SIGN ||
        buttons == RIGHT_QUOTE_SIGN);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(4.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: (buttons == EQUAL_SIGN)
                ? Theme.of(context).primaryColor
                : Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 4.0,
            shadowColor: Colors.grey.withOpacity(0.5),
          ),
          child: Text(
            buttons,
            style: TextStyle(
              color: (_colorTextButtons())
                  ? Colors.blueAccent
                  : (buttons == EQUAL_SIGN)
                      ? Colors.white
                      : Color(0xFF444444),
              fontSize: _fontSize() ? 18 : 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => onTap(buttonText: buttons),
        ),
      ),
    );
  }
}
