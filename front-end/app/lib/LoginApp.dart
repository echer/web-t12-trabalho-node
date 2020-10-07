import 'package:app/ui/pages/login/page-novo-usuario.dart';
import 'package:flutter/material.dart';

import 'ui/pages/login/page-login-usuario.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red,
        primaryColor: Colors.red,
        primaryColorDark: Colors.red,
        primaryColorLight: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        var routes = {
          LoginPage.routeName: (context) => LoginPage(),
          PageCadastroUsuario.routeName: (context) =>
              PageCadastroUsuario(settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      initialRoute: LoginPage.routeName,
    );
  }
}
