// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AuthController = BindInject(
  (i) => AuthController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  void entrar({String email, String senha}) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.entrar');
    try {
      return super.entrar(email: email, senha: senha);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
