import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/models/highlighter_page/highlighter_page_model.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/widgets/ProgressHighlighterPage.dart';
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

  List<HighlighterPageModel> _listNavHighlighter = [
    HighlighterPageModel(index: 0, isNowPage: false),
    HighlighterPageModel(index: 1, isNowPage: false),
    HighlighterPageModel(index: 2, isNowPage: false),
    HighlighterPageModel(index: 3, isNowPage: false),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
      
              child: Stack(
          children: <Widget>[
            _background,
            Container(
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.2,
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height * 0.05),
                          Container(
                            height: size.height * 0.10,
                            alignment: Alignment.center,
                            child: Text(
                              "CADASTRO",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "OpenSans",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return Container(
                              height: size.height * 0.05,
                              width: size.width,
                              child: AnimatedBuilder(
                                builder: (BuildContext context, Widget child) =>
                                    child,
                                animation: controller.pageController,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: _listNavHighlighter.map((item) {
                                    bool isNow = false;
                                    if (item.index <= controller.page.toInt())
                                      isNow = true;
                                    return ProgressHighlighterPage(isNow);
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.80,
                      child: PageView.builder(
                        controller: controller.pageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _listPages.length,
                        itemBuilder: (context, index) {
                          return _listPages[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
