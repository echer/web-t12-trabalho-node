import 'package:app/ui/pages/home/page-home.dart';
import 'package:app/ui/pages/veiculos/page-cadastro-veiculo.dart';
import 'package:app/ui/pages/veiculos/page-veiculo.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
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
          PageHome.routeName: (context) => PageHome(),
          PageVeiculo.routeName: (context) => PageVeiculo(),
          PageCadastroVeiculo.routeName: (context) =>
              PageCadastroVeiculo(settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      initialRoute: PageHome.routeName,
    );
  }
}
