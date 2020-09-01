import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../auth_controller.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController authController;
  _LoginControllerBase(this.authController) {
    this.checkLembraDeMim = false;
  }

  final formKey = GlobalKey<FormState>();
  String email = "";
  String senha = "";

  @action
  setEmail(String value) => this.email = value;

  @action
  setSenha(String value) => this.senha = value;

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
      print("$email - ${senha.codeUnits.toString()}");
      this.setError(false);
      this.setLoading(true); 
      authController.entrar(
        email: email.trim().toLowerCase(),
        senha: senha.trim(),
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
}
