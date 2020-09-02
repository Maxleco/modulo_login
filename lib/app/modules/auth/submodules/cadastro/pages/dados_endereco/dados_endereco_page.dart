import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomOutlineButtonAuth.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomOutlineButtonAuth(
                      onPressed: controller.back,
                      text: "VOLTAR",
                      elevation: 0.0,
                      width: size.width * 0.3,
                    ),
                    CustomButtonAuth(
                      onPressed: controller.next,
                      text: "AVANÇAR",
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
