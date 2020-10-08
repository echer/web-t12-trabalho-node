import 'package:app/LoginApp.dart';
import 'package:app/ui/pages/avisos/page-aviso.dart';
import 'package:app/ui/pages/veiculos/page-veiculo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageHome extends StatelessWidget {
  static const routeName = '/';

  PageHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Trabalho - Home Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text('Trabalho Alan Echer'),
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Meus Veiculos'),
              onTap: () =>
                  {Navigator.of(context).pushNamed(PageVeiculo.routeName)},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Meus Avisos'),
              onTap: () =>
                  {Navigator.of(context).pushNamed(PageAviso.routeName)},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("logged", "");
                prefs.setString("token", "");
                runApp(LoginApp());
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Text('Hello'),
      )),
    );
  }
}
