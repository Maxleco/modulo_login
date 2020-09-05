import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cadastro_controller.dart';

part 'dados_pessoais_controller.g.dart';

@Injectable()
class DadosPessoaisController = _DadosPessoaisControllerBase
    with _$DadosPessoaisController;

abstract class _DadosPessoaisControllerBase extends Disposable with Store {
  final CadastroController cadastroController;
  TextEditingController nomeController;
  TextEditingController sobrenomeController;
  MaskedTextController dataController;
  MaskedTextController phoneController;

  FocusNode focusSobrenome;
  FocusNode focusData;
  FocusNode focusTelefone;

  _DadosPessoaisControllerBase(this.cadastroController){
    nomeController = TextEditingController(text: "");
    sobrenomeController = TextEditingController(text: "");
    dataController = MaskedTextController(mask: "00/00/0000", text: "");
    phoneController = MaskedTextController(mask: "(00) 90000-0000", text: "");
    focusSobrenome = FocusNode();
    focusData = FocusNode();
    focusTelefone = FocusNode();
  }

  final formKey = GlobalKey<FormState>();

  void selectData(BuildContext context) async {
    DateTime initData = DateTime(DateTime.now().year - 1);
    if (dataController.text.isNotEmpty) {
      initData = convertStringForDate(dataController.text);
    }
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 120),
      lastDate: DateTime(DateTime.now().year),
      initialDate: initData,
    );
    if (date != null) {
      final dataFormat = _formatarData(date.toString());
      dataController.updateText(dataFormat);
    }
  }

  DateTime convertStringForDate(String textData) {
    List<String> listNumData = textData.split("/");
    String data = "";
    for (var item in listNumData.reversed) {
      data = data + item;
    }
    final result = DateTime.tryParse(data);
    return result;
  }

  String _formatarData(String data) {
    initializeDateFormatting("pt_BR");
    DateTime dataConvertida = DateTime.parse(data);
    //var formatter = DateFormat("d/M/y");
    var formatter = DateFormat.yMd("pt_BR");

    String dataFomatada = formatter.format(dataConvertida);
    return dataFomatada;
  }

  bool isValidData(String textData) {
    DateTime dataTime = convertStringForDate(textData);
    String data = _formatarData(dataTime.toString());
    if (data == textData) {
      return true;
    } else {
      return false;
    }
  }

  //----------------------
  @observable
  bool isError = false;

  @action
  setError(bool value) => this.isError = value;

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => this.isLoading = value;

  void next() {
    if (formKey.currentState.validate()) {
      setError(false);
      this.cadastroController.changePage(1);
    } else {
      setError(true);
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    sobrenomeController.dispose();
    dataController.dispose();
    phoneController.dispose();
    focusSobrenome.dispose();
    focusData.dispose();
    focusTelefone.dispose();
  }
}
