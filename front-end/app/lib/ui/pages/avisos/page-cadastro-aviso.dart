import 'package:app/data/domain/aviso.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/avisos/avisos-view-model.dart';
import 'package:flutter/material.dart';

class PageCadastroAviso extends StatefulWidget {
  static const routeName = '/cadastro/aviso';

  final Aviso model;

  PageCadastroAviso(this.model);

  @override
  _PageCadastroAviso createState() => _PageCadastroAviso();
}

class _PageCadastroAviso extends State<PageCadastroAviso> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AvisosViewModel viewModel = getIt<AvisosViewModel>();

    TextEditingController idController =
        TextEditingController(text: widget.model.id);
    TextEditingController nomeController =
        TextEditingController(text: widget.model.nome);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                //Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Realizando cadastro aguarde...')));

                Aviso createOrupdate =
                    Aviso(id: idController.text, nome: nomeController.text);

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
              onPressed: () => {},
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
                  controller: nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o Nome';
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