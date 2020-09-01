import 'package:flutter/material.dart';

class CadastroSucessoPage extends StatefulWidget {
  final String title;
  const CadastroSucessoPage({Key key, this.title = "CadastroSucesso"})
      : super(key: key);

  @override
  _CadastroSucessoPageState createState() => _CadastroSucessoPageState();
}

class _CadastroSucessoPageState extends State<CadastroSucessoPage> {
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
