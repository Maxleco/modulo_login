import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_page.dart';
import 'pages/dados_conta/dados_conta_controller.dart';
import 'pages/dados_endereco/dados_endereco_controller.dart';
import 'pages/dados_pessoais/dados_pessoais_controller.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastroController()),

        Bind((i) => DadosPessoaisController()),
        Bind((i) => DadosEnderecoController()),
        Bind((i) => DadosContaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
