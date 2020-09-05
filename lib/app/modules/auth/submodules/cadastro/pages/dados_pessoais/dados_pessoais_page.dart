import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldIconAuth.dart';
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
      child: Form(
        key: controller.formKey,
        child: AspectRatio(
          aspectRatio: size.aspectRatio,
          child: Container(
            height: size.height * 0.8,
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.075,
              // vertical: size.height * 0.10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      Observer(
                        builder: (BuildContext context) {
                          bool isError = controller.isError;
                          return CustomTextFieldAuth(
                            height: isError ? 70.0 : 50.0,
                            controller: controller.nomeController,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (String value) {
                              controller.focusSobrenome.requestFocus();
                            },
                            label: "Nome",
                            hint: "Digite seu Nome",
                            contentPadding: const EdgeInsets.only(left: 15.0),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15)
                            ],
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "    [Campo Obrigatório]";
                              }
                              if (value.length < 3) {
                                return "    [O Nome deve conter mais de 2 caracteres]";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Observer(
                        builder: (BuildContext context) {
                          bool isError = controller.isError;
                          return CustomTextFieldAuth(
                            height: isError ? 70.0 : 50.0,
                            controller: controller.sobrenomeController,
                            focusNode: controller.focusSobrenome,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (String value) {
                              controller.focusData.requestFocus();
                            },
                            label: "Sobrenome",
                            hint: "Digite seu Sobrenome",
                            contentPadding: const EdgeInsets.only(left: 15.0),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15)
                            ],
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "    [Campo Obrigatório]";
                              }
                              if (value.length < 3) {
                                return "    [O Nome deve conter mais de 2 caracteres]";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Observer(builder: (_) {
                        bool isError = controller.isError;
                        return CustomTextFieldIconAuth(
                          height: isError ? 70.0 : 50.0,
                          controller: controller.dataController,
                          focusNode: controller.focusData,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            controller.focusTelefone.requestFocus();
                          },
                          label: "Data de Nascimento",
                          hint: "00/00/0000",
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                          widgetIcon: Icon(
                            FontAwesomeIcons.calendar,
                            color: Colors.white,
                          ),
                          onPressedIcon: () {
                            controller.selectData(context);
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "    [Campo Obrigatório]";
                            }
                            if (value.length < 9) {
                              return "    [Data Incompleta]";
                            }
                            if (controller.isValidData(value) == false) {
                              return "    [Data Inválida]";
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
                          controller: controller.phoneController,
                          focusNode: controller.focusTelefone,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (String value) {
                            FocusScope.of(context).unfocus();
                          },
                          label: "Telefone",
                          hint: "(00) 90000-0000",
                          icon: Icons.phone,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "    [O campo é obrigatório]";
                            }
                            if (value.length < 15) {
                              return "    [Número de telefone Incompleto]";
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),
                  Container(
                    height: size.height * 0.2,
                    child: Column(
                      children: <Widget>[
                        CustomButtonAuth(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.next();
                          },
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
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
