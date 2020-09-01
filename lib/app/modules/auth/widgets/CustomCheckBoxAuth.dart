import 'package:flutter/material.dart';
import '../utils/StylesTexts.dart';

class CustomCheckBoxAuth extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onChanged;
  final Color checkColor;
  final Color activeColor;
  final VisualDensity visualDensity;

  const CustomCheckBoxAuth({
    @required this.value,
    @required this.onChanged,
    @required this.text,
    this.checkColor = Colors.green,
    this.activeColor = Colors.white,
    this.visualDensity = VisualDensity.compact,   
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              visualDensity: this.visualDensity,
              value: this.value,
              checkColor: this.checkColor,
              activeColor: this.activeColor,
              onChanged: this.onChanged,
            ),
          ),
          Text(
            this.text,
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
}
