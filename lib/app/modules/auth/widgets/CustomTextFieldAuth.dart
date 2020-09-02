import 'package:flutter/material.dart';
import '../../auth/utils/StylesTexts.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final double height;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String label;
  final Color color;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(String) onFieldSubmitted;
  final IconData icon;
  final String hint;
  final bool isPass;
  final Function onPressedVisiblePass;
  final Function(String) onSaved;
  final String Function(String) validator;

<<<<<<< HEAD
  const CustomTextFieldAuth({    
=======
  const CustomTextFieldAuth({
    this.controller,
>>>>>>> cadastro
    @required this.icon,
    @required this.label,
    this.onChanged,
    this.controller,
    this.hint,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
    this.color = Colors.white,
    this.isPass = false,
    this.onPressedVisiblePass,
    this.onSaved,
    this.validator,
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
            controller: this.controller,
            keyboardType: this.textInputType,
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
