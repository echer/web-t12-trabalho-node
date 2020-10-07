import 'package:app/App.dart';
import 'package:app/data/domain/usuario.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/login/login-view-model.dart';
import 'package:app/ui/pages/login/page-novo-usuario.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageForm createState() => _LoginPageForm();
}

class _LoginPageForm extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginViewModel model = getIt<LoginViewModel>();

    TextEditingController usuarioController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: usuarioController,
                decoration: InputDecoration(labelText: 'Usuário'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe o Usuário';
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
                    return 'Informe a senha';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Realizando login aguarde...')));

                    Usuario usuario = Usuario(
                        email: usuarioController.value.text,
                        senha: senhaController.value.text);
                    var loginSuccess =
                        await model.login(usuario).catchError((error) {
                      print(error);
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Não foi possível realizar o login: $error')));
                    });
                    if (loginSuccess != null &&
                        loginSuccess.token != null &&
                        loginSuccess.token.isNotEmpty) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("logged", "S");
                      prefs.setString("token", loginSuccess.token);
                      runApp(App());
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Não foi possível realizar o login, usuário ou senha incorretos!')));
                    }
                  }
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var usuarioCadastrado = await Navigator.of(context).pushNamed(
                      PageCadastroUsuario.routeName,
                      arguments: new Usuario());
                  if (usuarioCadastrado != null) {
                    Usuario usuario = usuarioCadastrado as Usuario;
                    usuarioController.text = usuario.email;
                    senhaController.text = usuario.senha;
                  }
                },
                child: Text('Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
