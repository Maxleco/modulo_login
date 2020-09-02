import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase extends Disposable with Store {
  final pageController = PageController(initialPage: 0);

  void changePage(double value) {
    double page = ((maxExtentPages / 4) * (value + 0.5));
    pageController.animateTo(
      page,
      duration: Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  double get maxExtentPages => this.pageController.position.maxScrollExtent;

  @computed
  double get currentPage => this.pageController.page;

  @override
  void dispose() {
    pageController.dispose();
  }
}
