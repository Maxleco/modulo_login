import 'package:modulo_login/app/modules/auth/pages/login/login_page.dart';

import 'auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';
import 'pages/login/login_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => AuthController(i.get<AuthStore>())),
        Bind((i) => AuthController()),

        Bind((i) => LoginController(i.get<AuthController>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AuthPage()),
        ModularRouter("/login", child: (_, args) => LoginPage()),
        // ModularRouter("/cadastro", child: (_, args) => ()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
