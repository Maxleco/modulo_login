import 'package:flutter/material.dart';
import '../utils/StylesTexts.dart';

class CustomFlatButtonAuth extends StatelessWidget {
  final AlignmentGeometry align;
  final String text;
  final Function onPressed;

  const CustomFlatButtonAuth({
    @required this.align,
    @required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: this.align,
      child: FlatButton(
        onPressed: this.onPressed,
        padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          this.text,
          style: kLabelStyle,
        ),
      ),
    );
  }
}
