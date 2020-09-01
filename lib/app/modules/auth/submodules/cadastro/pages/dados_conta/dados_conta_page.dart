import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
