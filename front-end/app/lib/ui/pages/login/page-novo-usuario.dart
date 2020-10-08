import 'package:app/data/domain/usuario.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/login/login-view-model.dart';
import 'package:flutter/material.dart';

class PageCadastroUsuario extends StatefulWidget {
  static const routeName = '/cadastro/usuario';

  final Usuario model;

  PageCadastroUsuario(this.model);

  @override
  _PageCadastroUsuario createState() => _PageCadastroUsuario();
}

class _PageCadastroUsuario extends State<PageCadastroUsuario> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = getIt<LoginViewModel>();

    TextEditingController idController =
        TextEditingController(text: widget.model.id);
    TextEditingController nomeController =
        TextEditingController(text: widget.model.nome);
    TextEditingController emailController =
        TextEditingController(text: widget.model.email);
    TextEditingController senhaController =
        TextEditingController(text: widget.model.senha);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                //Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Realizando cadastro aguarde...')));

                Usuario createOrupdate = Usuario(
                    id: idController.text,
                    nome: nomeController.text,
                    email: emailController.text,
                    senha: senhaController.text);

                await viewModel
                    .createOrUpdate(createOrupdate)
                    .catchError((error) {
                  print(error);
                }).then((value) {
                  Navigator.pop(context, createOrupdate);
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
                        controller: nomeController,
                        decoration: InputDecoration(labelText: 'Nome'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o Nome';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'E-mail'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o E-mail';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Senha'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe a Senha';
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
