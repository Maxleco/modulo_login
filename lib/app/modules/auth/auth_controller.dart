import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  // final AuthStore _authStore;
  // _AuthControllerBase(this._authStore);

  @action
  void entrar({String email, String senha}) {
    //  _authStore
    //     .setUser(UsuarioModel(email, senha));
    // Modular.to.showDialog(builder: (_) {
    //   return AlertDialog(
    //     content: CircularProgressIndicator(),
    //   );
    // });
    Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
  }
}
