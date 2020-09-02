import 'package:flutter/material.dart';
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

  @observable
  bool isError = false;

  @action
  set setError(bool value) => this.isError = value;

  final formKey = GlobalKey<FormState>();
  String email = "";
  String senha = "";
  String senhaConf = "";

  @action
  setEmail(String value) => this.email = value;

  @action
  setSenha(String value) => this.senha = value;

  @action
  setSenhaConf(String value) => this.senhaConf = value;

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
