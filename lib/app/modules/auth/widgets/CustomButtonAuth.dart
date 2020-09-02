import 'package:flutter/material.dart';
import '../utils/Colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double elevation;
  final double width;

  const CustomButtonAuth({
    @required this.onPressed,
    @required this.text,
    this.elevation = 5.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      width: this.width,
      child: RaisedButton(
        elevation: this.elevation,
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          this.text,
          style: TextStyle(
            color: MAIN_COLOR,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans",
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
