import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomOutlineButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldAuth.dart';
import 'dados_pessoais_controller.dart';

class DadosPessoaisPage extends StatefulWidget {
  final String title;
  const DadosPessoaisPage({Key key, this.title = "DadosPessoais"})
      : super(key: key);

  @override
  _DadosPessoaisPageState createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState
    extends ModularState<DadosPessoaisPage, DadosPessoaisController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: double.infinity,
        alignment: AlignmentDirectional.center,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.075,
            // vertical: size.height * 0.10,
          ),
          child: Form(
            // key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldAuth(
                          height: isError ? 70.0 : 50.0,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.nextFocus();
                          },
                          label: "Nome",
                          hint: "Digite seu Nome",
                          icon: Icons.email,
                          textInputType: TextInputType.emailAddress,
                          //onChanged: controller.setEmail,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "    [O campo é obrigatório]";
                            }
                            if (value.length < 3) {
                              return "    [Campo Inválido]";
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(height: size.height * 0.03),
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldAuth(
                          height: isError ? 70.0 : 50.0,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.nextFocus();
                          },
                          label: "Sobrenome",
                          hint: "Digite seu Sobrenome",
                          
                          icon: Icons.lock,
                          // onChanged: controller.setSenha,
                          // onPressedVisiblePass: () {
                          //   setState(() {
                          //     obscureText = !obscureText;
                          //   });
                          // },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "    [O campo é obrigatório]";
                            }
                            if (value.length < 3 || value.length > 12) {
                              return "    [Campo Inválido]";
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(height: size.height * 0.03),
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldAuth(
                          height: isError ? 70.0 : 50.0,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.nextFocus();
                          },
                          label: "Confirma Senha",
                          hint: "Entre novamente com sua Senha",
                          
                          icon: Icons.lock,
                          // onChanged: controller.setSenhaConf,
                          // onPressedVisiblePass: () {
                          //   setState(() {
                          //     obscureTextConf = !obscureTextConf;
                          //   });
                          // },
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
                    ],
                  ),
                CustomButtonAuth(
                      onPressed: controller.next,
                      text: "AVANÇAR",
                      elevation: 0.0,
                      width: size.width * 0.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushReplacementNamed("/login");
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Já tem uma Conta?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: " Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
