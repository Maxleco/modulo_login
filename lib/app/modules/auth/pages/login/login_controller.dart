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

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  //TextField Error
  @observable
  bool isError = false; 

  @action
  setError(bool value) => this.isError = value;

  //Loading
  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => this.isLoading = value;

  //Lembra de min
  @observable
  bool checkLembraDeMim;

  @action
  setLembraDeMim(bool value) => checkLembraDeMim = value;

  //Entrar
  @action
  void logar() {
    if (formKey.currentState.validate()) {
      this.setError(false);
      this.setLoading(true); 
      authController.entrar(
        email: emailController.text.toLowerCase(),
        senha: senhaController.text,
      );
    }
    else{
      this.setLoading(false);
      this.isError = true;
    }
    // Modular.to.showDialog(
    //   builder: (context) => AlertDialog(
    //     content: Text("Voce nao preencheu todos os dados!!!"),
    //     title: Text("Oppss..."),
    //   ),
    // );
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
  }
}
