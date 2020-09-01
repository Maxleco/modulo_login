import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/pages/dados_pessoais/dados_pessoais_controller.dart';

class DadosPessoaisPage extends StatefulWidget {
  @override
  _DadosPessoaisPageState createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends ModularState<DadosPessoaisPage, DadosPessoaisController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}