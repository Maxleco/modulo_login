import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cadastro_controller.dart';

part 'dados_pessoais_controller.g.dart';

@Injectable()
class DadosPessoaisController = _DadosPessoaisControllerBase
    with _$DadosPessoaisController;

abstract class _DadosPessoaisControllerBase extends Disposable with Store {
  final CadastroController cadastroController;
  _DadosPessoaisControllerBase(this.cadastroController);

  @action
  void next(){
    this.cadastroController.changePage(1);
  }

  @override
  void dispose() {
    // cadastroController.dispose();
  }
}
