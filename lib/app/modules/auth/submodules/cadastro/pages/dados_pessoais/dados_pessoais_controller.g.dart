// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_pessoais_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosPessoaisController = BindInject(
  (i) => DadosPessoaisController(i<CadastroController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosPessoaisController on _DadosPessoaisControllerBase, Store {
  final _$isErrorAtom = Atom(name: '_DadosPessoaisControllerBase.isError');

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

  final _$isLoadingAtom = Atom(name: '_DadosPessoaisControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_DadosPessoaisControllerBaseActionController =
      ActionController(name: '_DadosPessoaisControllerBase');

  @override
  dynamic setError(bool value) {
    final _$actionInfo = _$_DadosPessoaisControllerBaseActionController
        .startAction(name: '_DadosPessoaisControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_DadosPessoaisControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_DadosPessoaisControllerBaseActionController
        .startAction(name: '_DadosPessoaisControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DadosPessoaisControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isError: ${isError},
isLoading: ${isLoading}
    ''';
  }
}
