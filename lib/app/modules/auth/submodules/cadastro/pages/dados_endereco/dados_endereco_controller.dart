import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/cadastro_controller.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/models/dados_endereco/dados_endereco_model.dart';
import 'package:modulo_login/app/modules/auth/submodules/cadastro/repository/cep/cep_repository.dart';
import 'package:modulo_login/app/modules/auth/utils/Colors.dart';
import '../../repository/estados/estados_repository.dart';

part 'dados_endereco_controller.g.dart';

@Injectable()
class DadosEnderecoController = _DadosEnderecoControllerBase
    with _$DadosEnderecoController;

abstract class _DadosEnderecoControllerBase extends Disposable with Store {
  BuildContext context;
  void setContext(BuildContext contx) => this.context = contx;

  final CadastroController cadastroController;
  _DadosEnderecoControllerBase(this.cadastroController) {
    this.cepController = MaskedTextController(
      text: this.cadastroController.dadosEndereco.cep,
      mask: "00000-000",
    );
    this.ruaController = TextEditingController(
      text: this.cadastroController.dadosEndereco.rua,
    );
    this.numeroController = TextEditingController(
      text: this.cadastroController.dadosEndereco.numero,
    );
    this.compController = TextEditingController(
      text: this.cadastroController.dadosEndereco.complemento,
    );
    this.bairroController = TextEditingController(
      text: this.cadastroController.dadosEndereco.bairro,
    );
    this.cidadeController = TextEditingController(
      text: this.cadastroController.dadosEndereco.cidade,
    );
    this.siglaEstado = this.cadastroController.dadosEndereco.estado.isNotEmpty
        ? this.cadastroController.dadosEndereco.estado
        : EstadosRepository.estados[0];
    this.focusRua = FocusNode();
    this.focusNumero = FocusNode();
    this.focusComp = FocusNode();
    this.focusBairro = FocusNode();
    this.focusCidade = FocusNode();
  }

  MaskedTextController cepController;
  TextEditingController ruaController;
  TextEditingController numeroController;
  TextEditingController compController;
  TextEditingController bairroController;
  TextEditingController cidadeController;

  FocusNode focusRua;
  FocusNode focusNumero;
  FocusNode focusComp;
  FocusNode focusBairro;
  FocusNode focusCidade;

  final formKey = GlobalKey<FormState>();

  @observable
  String siglaEstado;

  @action
  void setSigleEstado(String value) => this.siglaEstado = value;

  List<DropdownMenuItem<String>> get getUF =>
      EstadosRepository.getEstadosAbrv();

  //----------------------
  // @observable
  // bool isCepValid = true;

  // @action
  // void setIsCepValid(bool value) => this.isCepValid = value;

  // Future validationCep(String cep, bool isLoading) async {
  //   setIsCepValid(
  //       await CepRepository.validCEP(cep.replaceFirst("-", ""), context, isLoading));
  // }

  Future findCEP() async {
    if (cepController.text.isNotEmpty) {
      DadosEnderecoModel dadosEndereco = await CepRepository.searchCEP(
        cepController.text.replaceFirst("-", ""),
        context,
      );
      if (dadosEndereco != null) setDadosEndereco(dadosEndereco);
    }
  }

  void setDadosEndereco(DadosEnderecoModel dadosEnderecoModel) {
    this.ruaController.text = dadosEnderecoModel.rua.toUpperCase();
    this.numeroController.text = dadosEnderecoModel.numero;
    this.compController.text = dadosEnderecoModel.complemento.toUpperCase();
    this.bairroController.text = dadosEnderecoModel.bairro.toUpperCase();
    this.cidadeController.text = dadosEnderecoModel.cidade.toUpperCase();
    this.setSigleEstado(dadosEnderecoModel.estado.toUpperCase());
  }

  //----------------------
  @observable
  bool isError = false;

  @action
  setError(bool value) => this.isError = value;

  //* Navegação
  void next() {
    if (this.cepController.text.isEmpty && this.cepController.text.length < 9) {
      this.formKey.currentState.validate();
      setError(true);
    } else {
      // Start Loading
      // Modular.to.showDialog(builder: (_) {
      //   return AlertDialog(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(15.0),
      //     ),
      //     content: Container(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         mainAxisSize: MainAxisSize.min,
      //         children: <Widget>[
      //           CircularProgressIndicator(
      //             valueColor: AlwaysStoppedAnimation<Color>(MAIN_COLOR),
      //           ),
      //           SizedBox(height: 15.0),
      //           Text(
      //             "Carregando ...",
      //             style: TextStyle(
      //               color: MAIN_COLOR,
      //               fontFamily: "OpenSans",
      //               fontSize: 24,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // });
      // Verifica validade do CEP
      //validationCep(this.cepController.text, true).whenComplete(() {
        if (formKey.currentState.validate()) {
          setError(false);
          var dadosEndereco = DadosEnderecoModel(
            cep: this.cepController.text,
            numero: this.numeroController.text,
            rua: this.ruaController.text.trim().toUpperCase(),
            comp: this.compController.text.trim().toUpperCase(),
            bairro: this.bairroController.text.trim().toUpperCase(),
            cidade: this.cidadeController.text.trim().toUpperCase(),
            estado: this.siglaEstado.trim().toUpperCase(),
          );
          this.cadastroController.setDadosEndereco(dadosEndereco);
          this.cadastroController.changePage(2);
        } else {
          setError(true);
        }
      //});
    }

  }

  void back() {
    this.cadastroController.disposeDadosEndereco();
    this.cadastroController.changePage(0);
  }

  @override
  void dispose() {
    this.cepController.dispose();
    this.ruaController.dispose();
    this.numeroController.dispose();
    this.compController.dispose();
    this.bairroController.dispose();
    this.cidadeController.dispose();
    this.focusRua.dispose();
    this.focusNumero.dispose();
    this.focusComp.dispose();
    this.focusBairro.dispose();
    this.focusCidade.dispose();
  }
}
