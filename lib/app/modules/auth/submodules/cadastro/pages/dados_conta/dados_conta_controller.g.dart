// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_conta_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosContaController = BindInject(
  (i) => DadosContaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosContaController on _DadosContaControllerBase, Store {
  final _$valueAtom = Atom(name: '_DadosContaControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_DadosContaControllerBaseActionController =
      ActionController(name: '_DadosContaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DadosContaControllerBaseActionController
        .startAction(name: '_DadosContaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DadosContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
