import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/Colors.dart';
import '../../widgets/CustomFlatButtonAuth.dart';
import '../../widgets/CustomTextFieldAuth.dart';
import '../../widgets/CustomButtonAuth.dart';
import '../../widgets/CustomCheckBoxAuth.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //Visible or not Visible the Password
  bool obscureText = true;

  Widget get _backGround {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: GRADIENT,
        stops: [0.1, 0.3, 0.4, 0.7],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              _backGround,
              Container(
                height: double.infinity,
                alignment: AlignmentDirectional.center,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.075,
                    // vertical: size.height * 0.10,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        //--------------------------------
                        Column(
                          children: <Widget>[
                            Observer(builder: (_) {
                              bool isError = controller.isError;
                              return CustomTextFieldAuth(
                                height: isError ? 70.0 : 50.0,
                                onChanged: controller.setEmail,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (String value) {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  currentFocus.nextFocus();
                                },
                                label: "Email",
                                hint: "Entre com seu Email",
                                icon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "    [O campo é obrigatório]";
                                  }
                                  if (value.contains("@") == false ||
                                      value.length < 4) {
                                    return "    [Email Inválido]";
                                  }
                                  return null;
                                },
                              );
                            }),
                            SizedBox(height: 30.0),
                            Observer(builder: (_) {
                              return CustomTextFieldAuth(
                                height: controller.isError ? 70.0 : 50.0,
                                onChanged: controller.setSenha,                                
                                label: "Senha",
                                hint: "Entre com sua Senha",
                                isPass: obscureText,
                                icon: Icons.lock,
                                onPressedVisiblePass: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "    [O campo é obrigatório]";
                                  }
                                  if (value.length < 3 || value.length > 12) {
                                    return "    [Senha Inválido]";
                                  }
                                  return null;
                                },
                              );
                            }),
                            CustomFlatButtonAuth(
                              align: Alignment.topRight,
                              text: "Esqueceu a Senha?",
                            ),
                            Observer(builder: (_) {
                              return CustomCheckBoxAuth(
                                text: "Lembre de mim",
                                value: controller.checkLembraDeMim,
                                onChanged: controller.setLembraDeMim,
                              );
                            }),
                            CustomButtonAuth(
                              text: "ENTRAR",
                              onPressed: controller.logar,
                            ),
                          ],
                        ),
                        //----------------------------------------
                        SizedBox(height: size.height * 0.025),
                        Container(
                          height: 50.0,
                          child: Observer(builder: (_) {
                            bool loading = controller.isLoading;
                            return loading
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white70),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Modular.to.pushReplacementNamed("/cadastro");
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Não possui uma conta?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " Inscrever-se",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),
                        //--------------------------
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
