import 'pages/dados_conta/dados_conta_controller.dart';
import 'pages/dados_endereco/dados_endereco_controller.dart';
import 'pages/dados_endereco_bloc.dart';
import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_page.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DadosContaController,
        $DadosEnderecoController,
        $DadosEnderecoBloc,
        Bind((i) => CadastroController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
