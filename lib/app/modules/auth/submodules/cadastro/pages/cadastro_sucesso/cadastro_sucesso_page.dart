import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modulo_login/app/modules/auth/widgets/CustomButtonAuth.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
    Container(
      height: size.height * 0.5,
      margin: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.checkCircle,
            color: Colors.greenAccent,
            size: 60,
          ),
          SizedBox(height: 25.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Cadastro realizado com sucesso!",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    CustomButtonAuth(
      onPressed: () {
        Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
      },
      text: "ENTRAR",
      elevation: 0.0,
      width:  size.width * 0.4,
    ),
        ],
      );
  }
}
