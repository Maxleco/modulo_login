import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../auth/utils/StylesTexts.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final double height;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final String label;
  final Color color;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
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

  const CustomTextFieldAuth({
    this.controller,
    this.focusNode,
    this.icon,
    this.sufixIcon,
    @required this.label,
    this.onChanged,
    this.hint,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.color = Colors.white,
    this.isPass = false,
    this.onPressedVisiblePass,
    this.onSaved,
    this.validator,
    this.contentPadding = const EdgeInsets.only(top: 15.0),
    @required this.height,
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
          child: TextFormField(
            obscureText: this.isPass,
            onChanged: this.onChanged,
            focusNode: this.focusNode,
            controller: this.controller,
            inputFormatters: this.inputFormatters,
            keyboardType: this.textInputType,
            textCapitalization: this.textCapitalization,            
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
      ],
    );
  }
}
