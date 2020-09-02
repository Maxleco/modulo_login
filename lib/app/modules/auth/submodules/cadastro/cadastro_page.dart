import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/utils/Colors.dart';
import 'cadastro_controller.dart';
import 'pages/cadastro_sucesso/cadastro_sucesso_page.dart';
import 'pages/dados_conta/dados_conta_page.dart';
import 'pages/dados_endereco/dados_endereco_page.dart';
import 'pages/dados_pessoais/dados_pessoais_page.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller

  Widget get _background {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: GRADIENT,
        stops: [0.1, 0.3, 0.4, 0.7],
      )),
    );
  }

  List<Widget> _listPages = [
    DadosPessoaisPage(),
    DadosEnderecoPage(),
    DadosContaPage(),
    CadastroSucessoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background,
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.20,
                        alignment: Alignment.center,
                        child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Container(
                height: size.height * 0.15,
                alignment: Alignment.center,
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "OpenSans",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.80,
                        child: PageView.builder(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _listPages.length,
            itemBuilder: (context, index){
              return _listPages[index];
            },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
