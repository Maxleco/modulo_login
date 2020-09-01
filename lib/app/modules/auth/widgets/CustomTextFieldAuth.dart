import 'package:flutter/material.dart';
import '../../auth/utils/StylesTexts.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final TextInputType textInputType;
  final IconData icon;
  final String hint;
  final bool isPass;
  final Function onPressedVisiblePass;

  const CustomTextFieldAuth({
    @required this.controller,
    @required this.icon,
    @required this.label,
    this.hint,
    this.textInputType = TextInputType.text,
    this.color = Colors.white,
    this.isPass = false,
    this.onPressedVisiblePass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          this.label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: this.controller,
            obscureText: this.isPass,
            keyboardType: this.textInputType,
            cursorColor: Colors.grey,
            style: TextStyle(
              color: this.color,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                this.icon,
                color: this.color,
              ),
              hintText: this.hint,
              hintStyle: kHintTextStyle,
              suffixIcon: this.onPressedVisiblePass != null
                  ? IconButton(
                      onPressed: this.onPressedVisiblePass,
                      icon: Icon(
                        isPass == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: this.color,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
