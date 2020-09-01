import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cadastro_controller.dart';

part 'dados_conta_controller.g.dart';

@Injectable()
class DadosContaController = _DadosContaControllerBase
    with _$DadosContaController;

abstract class _DadosContaControllerBase extends Disposable with Store {
  final CadastroController cadastroController;
  _DadosContaControllerBase(this.cadastroController);

  @action
  void next(){
    this.cadastroController.changePage(3);
  }

  void back(){
    this.cadastroController.changePage(1);
  }

  @override
  void dispose() {
    // cadastroController.dispose();
  }
}
