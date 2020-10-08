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
    TextEditingController tituloController =
        TextEditingController(text: widget.model.titulo);
    TextEditingController messageController =
        TextEditingController(text: widget.model.message);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                //Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Realizando cadastro aguarde...')));

                Aviso createOrupdate = Aviso(
                    id: idController.text,
                    titulo: tituloController.text,
                    message: messageController.text);

                await viewModel.createOrUpdate(createOrupdate).then((value) {
                  Navigator.pop(context, 'refresh');
                }, onError: (e) {
                  print(e);
                }).catchError((error) {
                  print(error);
                });
              }
            },
          ),
          if (idController.text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                Aviso obj = Aviso(id: idController.text);

                await viewModel.delete(obj).then((value) {
                  Navigator.pop(context, 'refresh');
                }, onError: (e) {
                  print(e);
                }).catchError((error) {
                  print(error);
                });
              },
            ),
        ],
        title: Text(idController.text.isEmpty
            ? 'Novo Registro'
            : 'Editar: ${idController.text}'),
      ),
      body: SafeArea(
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Form(
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
                        controller: tituloController,
                        decoration: InputDecoration(labelText: 'Título'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o Título';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(labelText: 'Mensagem'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe a Mensagem';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
