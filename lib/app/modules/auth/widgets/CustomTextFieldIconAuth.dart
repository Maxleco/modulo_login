import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_login/app/modules/auth/utils/StylesTexts.dart';

class CustomTextFieldIconAuth extends StatelessWidget {
  final double height;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final String label;
  final Color color;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final Function(String) onFieldSubmitted;
  final IconData icon;
  final String hint;
  final bool isPass;
  final Function onPressedVisiblePass;
  final Function(String) onSaved;
  final String Function(String) validator;
  final EdgeInsetsGeometry contentPadding;
  final Widget sufixIcon;

  final Icon widgetIcon;
  final Function() onPressedIcon;

  const CustomTextFieldIconAuth({
    this.controller,
    this.focusNode,
    this.icon,
    this.sufixIcon,
    @required this.label,
    this.onChanged,
    this.hint,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.color = Colors.white,
    this.isPass = false,
    this.onPressedVisiblePass,
    this.onSaved,
    this.validator,
    this.contentPadding = const EdgeInsets.only(top: 10.0),
    @required this.height,
    this.widgetIcon,
    this.onPressedIcon,
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
          height: this.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: TextFormField(
                  obscureText: this.isPass,
                  onChanged: this.onChanged,
                  focusNode: this.focusNode,
                  controller: this.controller,
                  keyboardType: this.textInputType,
                  inputFormatters: this.inputFormatters,
                  textInputAction: this.textInputAction,
                  onFieldSubmitted: this.onFieldSubmitted,
                  cursorColor: Colors.grey,
                  onSaved: this.onSaved,
                  validator: this.validator,
                  style: TextStyle(
                    color: this.color,
                    fontFamily: "OpenSans",
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: this.contentPadding,
                    prefixIcon: this.icon != null
                        ? Icon(
                            this.icon,
                            color: this.color,
                          )
                        : null,
                    hintText: this.hint,
                    hintStyle: kHintTextStyle,
                    suffix: this.sufixIcon,
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
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: this.widgetIcon,
                  onPressed: this.onPressedIcon,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
