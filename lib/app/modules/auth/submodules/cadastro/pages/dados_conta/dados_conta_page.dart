import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomOutlineButtonAuth.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[                
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
