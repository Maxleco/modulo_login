import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/utils/Colors.dart';
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

  bool obscureText = true;
  bool obscureTextConf = true;
  FocusNode focusConfSenha;

  @override
  void initState() {
    super.initState();
    focusConfSenha = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusConfSenha.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: controller.formKey,
        child: AspectRatio(
          aspectRatio: size.aspectRatio,
          child: Container(
            height: size.height * 0.8,
            alignment: AlignmentDirectional.center,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.075,
                // vertical: size.height * 0.10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _selectFoto(),
                  SizedBox(height: size.height * 0.04),
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
                          label: "Email",
                          hint: "Entre com seu Email",
                          icon: Icons.email,
                          textInputType: TextInputType.emailAddress,
                          onChanged: controller.setEmail,
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
                      SizedBox(height: size.height * 0.03),
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldAuth(
                          height: isError ? 70.0 : 50.0,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            if (focusConfSenha.canRequestFocus)
                              focusConfSenha.requestFocus();
                          },
                          label: "Senha",
                          hint: "Entre com sua Senha",
                          isPass: obscureText,
                          icon: Icons.lock,
                          onChanged: controller.setSenha,
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
                      SizedBox(height: size.height * 0.03),
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldAuth(
                          height: isError ? 70.0 : 50.0,
                          focusNode: focusConfSenha,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (String value) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.unfocus();
                          },
                          label: "Confirma Senha",
                          hint: "Entre novamente com sua Senha",
                          isPass: obscureTextConf,
                          icon: Icons.lock,
                          onChanged: controller.setSenhaConf,
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
                            if (value != controller.senha) {
                              return "    [Senha Incorreta]";
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),
                  Observer(builder: (_) {
                    bool isError = controller.isError;
                    double porcento = isError ? 0.05 : 0.035;
                    return SizedBox(height: size.height * porcento);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomOutlineButtonAuth(
                        onPressed: controller.back,
                        text: "VOLTAR",
                        elevation: 0.0,
                        width: size.width * 0.3,
                      ),
                      CustomButtonAuth(
                        onPressed: controller.next,
                        text: "CONCLUIR",
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
      ),
    );
  }

  Widget _selectFoto() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (_) {
                return CircleAvatar(
                  backgroundColor: Colors.white54,
                  backgroundImage: controller.image == null
                      ? null
                      : FileImage(controller.image),
                  child: controller.image != null
                      ? null
                      : Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                  maxRadius: 55,
                );
              }),
              Text(
                "(Opicional)",
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton.icon(
                onPressed: () {
                  controller.capturar("camera");
                },
                icon: Icon(Icons.camera_alt),
                label: Text("Câmera"),
                elevation: 0,
                color: Colors.grey[100],
                textColor: MAIN_COLOR,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              RaisedButton.icon(
                onPressed: () {
                  controller.capturar("galeria");
                },
                icon: Icon(Icons.photo),
                label: Text("Galeria"),
                elevation: 0,
                color: Colors.grey[100],
                textColor: MAIN_COLOR,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
