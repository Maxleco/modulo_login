import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_login/app/modules/auth/utils/StylesTexts.dart';

class CustomTextFieldTwoLineAuth extends StatelessWidget {
  final double height;
  final String label;
  final Color color;
  final IconData icon;
  final bool isPass;
  final Function onPressedVisiblePass;

  final String prymaryHint;
  final String secondyHint;
  final TextEditingController prymaryController;
  final TextEditingController secondyController;
  final FocusNode prymaryFocusNode;
  final FocusNode secondyFocusNode;
  final Function(String) prymaryOnChanged;
  final Function(String) secondyOnChanged;
  final TextCapitalization prymaryTextCapitalization;
  final TextCapitalization secondyTextCapitalization;
  final TextInputType prymaryTextInputType;
  final TextInputType secondyTextInputType;
  final List<TextInputFormatter> prymaryInputFormatters;
  final List<TextInputFormatter> secondyInputFormatters;
  final TextInputAction prymaryTextInputAction;
  final TextInputAction secondyTextInputAction;
  final Function(String) prymaryOnFieldSubmitted;
  final Function(String) secondyOnFieldSubmitted;
  final Function(String) prymaryOnSaved;
  final Function(String) secondyOnSaved;
  final String Function(String) prymaryValidator;
  final String Function(String) secondyValidator;
  final EdgeInsetsGeometry prymaryContentPadding;
  final EdgeInsetsGeometry secondyContentPadding;

  const CustomTextFieldTwoLineAuth({
    this.prymaryController,
    this.secondyController,
    this.prymaryFocusNode,
    this.secondyFocusNode,
    @required this.icon,
    @required this.label,
    this.prymaryOnChanged,
    this.secondyOnChanged,
    this.prymaryHint,
    this.secondyHint,
    this.prymaryTextCapitalization,
    this.secondyTextCapitalization,
    this.prymaryTextInputType = TextInputType.text,
    this.secondyTextInputType = TextInputType.text,
    this.prymaryInputFormatters,
    this.secondyInputFormatters,
    this.prymaryTextInputAction,
    this.secondyTextInputAction,
    this.prymaryOnFieldSubmitted,
    this.secondyOnFieldSubmitted,
    this.color = Colors.white,
    this.isPass = false,
    this.onPressedVisiblePass,
    this.prymaryOnSaved,
    this.secondyOnSaved,
    this.prymaryValidator,
    this.secondyValidator,
    @required this.height,
    this.prymaryContentPadding = const EdgeInsets.only(top: 10.0),
    this.secondyContentPadding = const EdgeInsets.only(top: 10.0),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(this.icon, color: this.color),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextFormField(
                      obscureText: this.isPass,
                      onChanged: this.prymaryOnChanged,
                      focusNode: this.prymaryFocusNode,
                      controller: this.prymaryController,
                      keyboardType: this.prymaryTextInputType,
                      inputFormatters: this.prymaryInputFormatters,
                      textInputAction: this.prymaryTextInputAction,
                      textCapitalization: this.prymaryTextCapitalization,
                      onFieldSubmitted: this.prymaryOnFieldSubmitted,
                      cursorColor: Colors.grey,
                      onSaved: this.prymaryOnSaved,
                      validator: this.prymaryValidator,

                      style: TextStyle(
                        color: this.color,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: this.prymaryContentPadding,
                        hintText: this.prymaryHint,
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
                        isDense: true,
                      ),
                    ),
                    TextFormField(
                      obscureText: this.isPass,
                      onChanged: this.secondyOnChanged,
                      focusNode: this.secondyFocusNode,
                      controller: this.secondyController,
                      keyboardType: this.secondyTextInputType,
                      inputFormatters: this.secondyInputFormatters,
                      textInputAction: this.secondyTextInputAction,
                      textCapitalization: this.secondyTextCapitalization,
                      onFieldSubmitted: this.secondyOnFieldSubmitted,
                      cursorColor: Colors.grey,
                      onSaved: this.secondyOnSaved,
                      validator: this.secondyValidator,
                      style: TextStyle(
                        color: this.color,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: this.secondyContentPadding,
                        hintText: this.secondyHint,
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
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
