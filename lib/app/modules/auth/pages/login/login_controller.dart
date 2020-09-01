import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../auth_controller.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends Disposable with Store {
  final AuthController authController;
  _LoginControllerBase(this.authController) {
    this.checkLembraDeMim = false;
  }

  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @observable
  bool checkLembraDeMim;

  @action
  setLembraDeMim(bool value) => checkLembraDeMim = value;

  void logar() {
    if (emailController.text != null &&
        emailController.text != "" &&
        senhaController.text != null &&
        senhaController.text != "") {
      authController.entrar(
        email: emailController.text.toLowerCase(),
        senha: senhaController.text,
      );
    } else {
      Modular.to.showDialog(
        builder: (context) => AlertDialog(
          content: Text("Voce nao preencheu todos os dados!!!"),
          title: Text("Oppss..."),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
  }
}
