import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dados_conta_controller.g.dart';

@Injectable()
class DadosContaController = _DadosContaControllerBase
    with _$DadosContaController;

abstract class _DadosContaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
