// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_conta_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosContaController = BindInject(
  (i) => DadosContaController(i<CadastroController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosContaController on _DadosContaControllerBase, Store {
  final _$imageAtom = Atom(name: '_DadosContaControllerBase.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$isErrorAtom = Atom(name: '_DadosContaControllerBase.isError');

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

  final _$isLoadingAtom = Atom(name: '_DadosContaControllerBase.isLoading');

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

  final _$_DadosContaControllerBaseActionController =
      ActionController(name: '_DadosContaControllerBase');

  @override
  dynamic setImage(File value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(bool value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenhaConf(String value) {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.setSenhaConf');
    try {
      return super.setSenhaConf(value);
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void next() {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.next');
    try {
      return super.next();
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
isError: ${isError},
isLoading: ${isLoading}
    ''';
  }
}
