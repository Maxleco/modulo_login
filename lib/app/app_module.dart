import 'package:modulo_login/app/modules/auth/auth_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:modulo_login/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: AuthModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
