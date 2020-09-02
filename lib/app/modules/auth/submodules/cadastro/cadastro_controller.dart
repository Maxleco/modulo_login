import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase extends Disposable with Store {
  _CadastroControllerBase();

  PageController pageController = PageController(initialPage: 0);

  @observable
  double page = 0;

  @action
  setPage(double value) => this.page = value;

  @action
  void changePage(double value) {
    double page;
    if (value == 3) {
      page = maxExtentPages;
    } else {
      page = ((maxExtentPages / 4) * (value + 0.3));
    }
    pageController.animateTo(
      page,
      duration: Duration(milliseconds: 250),
      curve: Curves.linear,
    );
    setPage(value);
  }

  double get maxExtentPages => this.pageController.position.maxScrollExtent;
  // Future<File> _treatImage(File fileImage) async {
  //   Directory tempDir = await getTemporaryDirectory();
  //   String path = tempDir.path;
  //   //? String title = _titleController.text;

  //   String emailUser = "";
  //   for (var letra in widget.user.email.codeUnits) {
  //     emailUser += letra.toString();
  //   }

  //   Img.Image image = Img.decodeImage(fileImage.readAsBytesSync());
  //   Img.Image smallerImg = Img.copyResize(image, width: 500);

  //   File compressImg = new File("$path/image_$emailUser.jpg")
  //     ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 10));
  //   return compressImg;
  // }

  @override
  void dispose() {
    pageController.dispose();
  }
}
