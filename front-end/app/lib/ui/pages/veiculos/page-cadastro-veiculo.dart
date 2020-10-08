import 'package:app/data/domain/veiculo.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/utils/decimal-input-format.dart';
import 'package:app/ui/pages/veiculos/veiculo-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageCadastroVeiculo extends StatefulWidget {
  static const routeName = '/cadastro/veiculo';

  final Veiculo model;

  PageCadastroVeiculo(this.model);

  @override
  _PageCadastroVeiculo createState() => _PageCadastroVeiculo();
}

class _PageCadastroVeiculo extends State<PageCadastroVeiculo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    VeiculoViewModel viewModel = getIt<VeiculoViewModel>();

    TextEditingController idController =
        TextEditingController(text: widget.model.id);
    TextEditingController marcaController =
        TextEditingController(text: widget.model.marca);
    TextEditingController modeloController =
        TextEditingController(text: widget.model.modelo);
    TextEditingController placaController =
        TextEditingController(text: widget.model.placa);
    TextEditingController anoController =
        TextEditingController(text: widget.model.ano.toString());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                //Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Realizando cadastro aguarde...')));

                Veiculo createOrupdate = Veiculo(
                    id: idController.text,
                    marca: marcaController.text,
                    modelo: modeloController.text,
                    placa: placaController.text,
                    ano: int.tryParse(anoController.text)?.toInt());

                await viewModel
                    .createOrUpdate(createOrupdate)
                    .catchError((error) {
                  print(error);
                }).then((value) {
                  Navigator.pop(context, 'refresh');
                });
              }
            },
          ),
          if (idController.text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                Veiculo obj = Veiculo(id: idController.text);

                await viewModel.delete(obj).catchError((error) {
                  print(error);
                }).then((value) {
                  Navigator.pop(context, 'refresh');
                });
              },
            ),
        ],
        title: Text(idController.text.isEmpty
            ? 'Novo Registro'
            : 'Editar: ${idController.text}'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: idController,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(labelText: 'ID'),
                ),
                TextFormField(
                  controller: modeloController,
                  decoration: InputDecoration(labelText: 'Modelo'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o Modelo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: marcaController,
                  decoration: InputDecoration(labelText: 'Marca'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe a Marca';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: placaController,
                  decoration: InputDecoration(labelText: 'Placa'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe a Placa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: modeloController,
                  decoration: InputDecoration(labelText: 'Ano'),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o Ano';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
