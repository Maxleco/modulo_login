import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cadastro_controller.dart';

part 'dados_conta_controller.g.dart';

@Injectable()
class DadosContaController = _DadosContaControllerBase
    with _$DadosContaController;

abstract class _DadosContaControllerBase extends Disposable with Store {
  final _picker = ImagePicker();
  final CadastroController cadastroController;
  _DadosContaControllerBase(this.cadastroController);

  @observable
  File image;

  @action
  setImage(File value) => image = value; 

  void capturar(String op) async {
    PickedFile imageSelected;
    if (op == "camera") {
      imageSelected = await _picker.getImage(source: ImageSource.camera);
    } else if (op == "galeria") {
      imageSelected = await _picker.getImage(source: ImageSource.gallery);
    }
    if (imageSelected != null) {
      setImage(File(imageSelected.path));
    }
  }

  //----
  @observable
  bool isError = false;

  @action
  setError(bool value) => this.isError = value;

  @observable
  bool isLoading = false;
  
  @action
  setLoading(bool value) => this.isLoading = value;

  final formKey = GlobalKey<FormState>();
  String email = "";
  String senha = "";
  String senhaConf = "";

  @action
  setEmail(String value) => this.email = value;

  @action
  setSenha(String value) => this.senha = value;

  @action
  setSenhaConf(String value) => this.senhaConf = value;

  void next(){
    if(formKey.currentState.validate()){
      setError(false);
      this.cadastroController.changePage(3);
    }
    else{
      setError(true);
    }
  }

  void back(){
    this.cadastroController.changePage(1);
  }

  @override
  void dispose() {
    // cadastroController.dispose();
  }
}
