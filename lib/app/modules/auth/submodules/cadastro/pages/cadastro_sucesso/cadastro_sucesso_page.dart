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
    return Center(
      child: Text(
        "Cadastro realizado com sucesso!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
