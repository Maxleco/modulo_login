import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/cadastro_controller.dart';

part 'dados_endereco_controller.g.dart';

@Injectable()
class DadosEnderecoController = _DadosEnderecoControllerBase
    with _$DadosEnderecoController;

abstract class _DadosEnderecoControllerBase extends Disposable with Store {
  final CadastroController cadastroController;
  _DadosEnderecoControllerBase(this.cadastroController);

  void next(){
    this.cadastroController.changePage(2);
  }

  void back(){
    this.cadastroController.changePage(0);
  }

  @override
  void dispose() {
    // cadastroController.dispose();
  }
}
