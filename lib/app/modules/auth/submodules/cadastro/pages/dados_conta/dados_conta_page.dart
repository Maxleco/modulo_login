import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomOutlineButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldAuth.dart';
import 'dados_conta_controller.dart';

class DadosContaPage extends StatefulWidget {
  final String title;
  const DadosContaPage({Key key, this.title = "DadosConta"}) : super(key: key);

  @override
  _DadosContaPageState createState() => _DadosContaPageState();
}

class _DadosContaPageState
    extends ModularState<DadosContaPage, DadosContaController> {
  //use 'controller' variable to access controller

  bool obscureText = false;
  bool obscureTextConf = false;

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
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Observer(builder: (_) {
                      bool isError = controller.isError;
                      return CustomTextFieldAuth(
                        height: isError ? 70.0 : 60.0,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
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
                        height: controller.isError ? 70.0 : 60.0,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          currentFocus.nextFocus();
                        },
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
                    SizedBox(height: 30.0),
                    Observer(builder: (_) {
                      return CustomTextFieldAuth(
                        height: controller.isError ? 70.0 : 60.0,
                        label: "Confirma Senha",
                        hint: "Entre novamente com sua Senha",
                        isPass: obscureTextConf,
                        icon: Icons.lock,
                        onPressedVisiblePass: () {
                          setState(() {
                            obscureTextConf = !obscureTextConf;
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
                  ],
                ),
                Column(
                  children: <Widget>[
                    CustomButtonAuth(
                      onPressed: controller.next,
                      text: "CONCLUIR",
                      elevation: 0.0,
                      width: size.width * 0.5,
                    ),
                    CustomOutlineButtonAuth(
                      onPressed: controller.back,
                      text: "VOLTAR",
                      elevation: 0.0,
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
