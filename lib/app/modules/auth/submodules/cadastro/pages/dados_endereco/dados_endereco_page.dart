import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomDropdownButton.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomOutlineButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomTextFieldIconAuth.dart';
import 'dados_endereco_controller.dart';

class DadosEnderecoPage extends StatefulWidget {
  final String title;
  const DadosEnderecoPage({Key key, this.title = "DadosEndereco"})
      : super(key: key);

  @override
  _DadosEnderecoPageState createState() => _DadosEnderecoPageState();
}

class _DadosEnderecoPageState
    extends ModularState<DadosEnderecoPage, DadosEnderecoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
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
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      CustomTextFieldIconAuth(
                        height: 50.0,
                        controller: controller.cepController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          controller.focusRua.requestFocus();
                        },
                        label: "CEP",
                        hint: "00000-000",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                            controller.cadastroController.dadosEndereco
                                .toNumCaracteres()["cep"],
                          ),
                        ],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "    [Campo Obrigatório]";
                          }
                          if (value.length < 9) {
                            return "    [O CEP está Incompleto]";
                          }
                          // if (controller.isCepValid == null) {
                          //   return "    [ERRO NA CONEXAO]";
                          // }
                          // if (controller.isCepValid == false) {
                          //   return "    [O CEP é Inválido]";
                          // }
                          return null;
                        },
                        widgetIcon: Icon(
                          FontAwesomeIcons.searchLocation,
                          color: Colors.white,
                        ),
                        onPressedIcon: controller.findCEP,
                      ),
                      SizedBox(height: size.height * 0.03),
                      CustomTextFieldAuth(
                        height: 50.0,
                        controller: controller.ruaController,
                        focusNode: controller.focusRua,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          controller.focusNumero.requestFocus();
                        },
                        label: "Endereço",
                        hint: " - ",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                            controller.cadastroController.dadosEndereco
                                .toNumCaracteres()["rua"],
                          ),
                        ],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "    [Campo Obrigatório]";
                          }
                          if (value.length < 4) {
                            return "    [O endereço deve conter mais de 3 caracteres]";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: CustomTextFieldAuth(
                              height: 50.0,
                              controller: controller.numeroController,
                              focusNode: controller.focusNumero,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                controller.focusComp.requestFocus();
                              },
                              label: "Número",
                              hint: "",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                  controller.cadastroController.dadosEndereco
                                      .toNumCaracteres()["numero"],
                                ),
                              ],
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldAuth(
                              height: 50.0,
                              controller: controller.compController,
                              focusNode: controller.focusComp,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                controller.focusBairro.requestFocus();
                              },
                              label: "Complemento",
                              hint: "",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                  controller.cadastroController.dadosEndereco
                                      .toNumCaracteres()["complemento"],
                                ),
                              ],
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      CustomTextFieldAuth(
                        height: 50.0,
                        controller: controller.bairroController,
                        focusNode: controller.focusBairro,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          controller.focusCidade.requestFocus();
                        },
                        label: "Bairro",
                        hint: " - ",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                            controller.cadastroController.dadosEndereco
                                .toNumCaracteres()["bairro"],
                          ),
                        ],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "    [Campo Obrigatório]";
                          }
                          if (value.length < 4) {
                            return "    [O Bairro deve conter mais de 3 caracteres]";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldAuth(
                              height: 50.0,
                              controller: controller.cidadeController,
                              focusNode: controller.focusCidade,
                              textCapitalization: TextCapitalization.sentences,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context).unfocus();
                              },
                              label: "Cidade",
                              hint: " - ",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                  controller.cadastroController.dadosEndereco
                                      .toNumCaracteres()["cidade"],
                                ),
                              ],
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "    [Campo Obrigatório]";
                                }
                                if (value.length < 4) {
                                  return "    [A Cidade deve conter mais de 3 caracteres]";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Observer(builder: (_) {
                              return CustomDropdownButton(
                                height: 50.0,
                                label: "Estado",
                                hint: "UF",
                                value: controller.siglaEstado,
                                items: controller.getUF,
                                onChanged: controller.setSigleEstado,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomOutlineButtonAuth(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.back();
                          },
                          text: "VOLTAR",
                          elevation: 0.0,
                          width: size.width * 0.3,
                        ),
                        CustomButtonAuth(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.next();
                          },
                          text: "AVANÇAR",
                          elevation: 0.0,
                          width: size.width * 0.4,
                        ),
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
