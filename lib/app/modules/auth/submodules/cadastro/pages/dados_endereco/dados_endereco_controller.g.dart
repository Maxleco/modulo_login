// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_endereco_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosEnderecoController = BindInject(
  (i) => DadosEnderecoController(i<CadastroController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosEnderecoController on _DadosEnderecoControllerBase, Store {
  final _$siglaEstadoAtom =
      Atom(name: '_DadosEnderecoControllerBase.siglaEstado');

  @override
  String get siglaEstado {
    _$siglaEstadoAtom.reportRead();
    return super.siglaEstado;
  }

  @override
  set siglaEstado(String value) {
    _$siglaEstadoAtom.reportWrite(value, super.siglaEstado, () {
      super.siglaEstado = value;
    });
  }

  final _$isErrorAtom = Atom(name: '_DadosEnderecoControllerBase.isError');

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  final _$_DadosEnderecoControllerBaseActionController =
      ActionController(name: '_DadosEnderecoControllerBase');

  @override
  void setSigleEstado(String value) {
    final _$actionInfo = _$_DadosEnderecoControllerBaseActionController
        .startAction(name: '_DadosEnderecoControllerBase.setSigleEstado');
    try {
      return super.setSigleEstado(value);
    } finally {
      _$_DadosEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(bool value) {
    final _$actionInfo = _$_DadosEnderecoControllerBaseActionController
        .startAction(name: '_DadosEnderecoControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_DadosEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
siglaEstado: ${siglaEstado},
isError: ${isError}
    ''';
  }
}
