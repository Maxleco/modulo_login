import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dados_endereco_controller.g.dart';

@Injectable()
class DadosEnderecoController = _DadosEnderecoControllerBase
    with _$DadosEnderecoController;

abstract class _DadosEnderecoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
