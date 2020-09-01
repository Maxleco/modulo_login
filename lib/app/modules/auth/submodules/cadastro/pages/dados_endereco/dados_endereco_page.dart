import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
