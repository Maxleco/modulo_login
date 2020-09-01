import 'package:flutter/material.dart';

class CustomOutlineButtonAuth extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double elevation;
  final Color corBorder;

  const CustomOutlineButtonAuth({
    @required this.onPressed,
    @required this.text,
    this.elevation = 5.0,
    this.corBorder = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
        elevation: this.elevation,
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: this.corBorder, width: 3,
          ),
        ),
        color: Colors.transparent,
        child: Text(
          this.text,
          style: TextStyle(
            color: this.corBorder,
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
