import 'package:flutter/material.dart';

class CustomOutlineButtonAuth extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double elevation;
  final Color corBorder;
  final double width;

  const CustomOutlineButtonAuth({
    @required this.onPressed,
    @required this.text,
    this.elevation = 5.0,
    this.corBorder = Colors.white,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
        elevation: this.elevation,
        padding: const EdgeInsets.all(7.5),
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
