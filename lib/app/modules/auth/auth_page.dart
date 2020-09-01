import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/Colors.dart';
import 'utils/StylesTexts.dart';
import 'widgets/CustomButtonAuth.dart';
import 'auth_controller.dart';
import 'widgets/CustomIconButtonAuth.dart';
import 'widgets/CustomOutlineButtonAuth.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  //use 'controller' variable to access controller

  Widget get _backGround {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: GRADIENT,
          stops: [0.1, 0.3, 0.4, 0.7],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backGround,
          Container(
            color: Colors.transparent,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(size.width * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      // Image.asset(
                      //   "assets/logo_bwolf.png",
                      //   height: size.height * 0.3,
                      //   width: size.height * 0.3,
                      // ),
                      Container(
                        height: size.height * 0.3,
                        width: size.height * 0.3,
                        alignment: Alignment.center,
                        child: FaIcon(FontAwesomeIcons.atom, size: 175),
                      ),
                      Text(
                        "Atom",
                        style: GoogleFonts.chelseaMarket(fontSize: 30),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.15),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomOutlineButtonAuth(
                        onPressed: () {},
                        text: "CADASTRAR",
                        elevation: 0.0,
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          Modular.link.pushReplacementNamed("/login");
                        },
                        text: "LOGIN",
                        elevation: 0.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "- OR -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Entrar com",
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomIconButtonAuth(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.facebookF).icon,
                            cor: Colors.blue[700]),
                        SizedBox(width: 20),
                        CustomIconButtonAuth(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.google).icon,
                          cor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
