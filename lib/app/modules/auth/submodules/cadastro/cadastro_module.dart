import 'package:dio/dio.dart';

import 'pages/dados_conta/dados_conta_controller.dart';
import 'pages/dados_endereco/dados_endereco_controller.dart';
import 'pages/dados_pessoais/dados_pessoais_controller.dart';
import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_page.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DadosContaController(i.get<CadastroController>())),
        Bind((i) => DadosEnderecoController(i.get<CadastroController>())),
        Bind((i) => DadosPessoaisController(i.get<CadastroController>())),
        // $CadastroController,
        Bind((i) => CadastroController()),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
