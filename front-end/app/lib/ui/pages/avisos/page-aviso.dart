import 'package:app/data/domain/aviso.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/avisos/adapter/lista-aviso-item.dart';
import 'package:app/ui/pages/avisos/avisos-view-model.dart';
import 'package:app/ui/pages/avisos/page-cadastro-aviso.dart';
import 'package:app/ui/pages/shimmer/lista-shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageAviso extends StatefulWidget {
  static const routeName = '/avisos';

  @override
  _PageAviso createState() => _PageAviso();
}

class _PageAviso extends State<PageAviso> {
  AvisosViewModel model = getIt<AvisosViewModel>();

  bool loading = false;

  @override
  void initState() {
    loading = true;
    model.list().catchError((error) {
      print(error);
      model.notifyListeners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback onCountSelected = () async {
      await model.list().catchError((error) {
        print(error);
        model.notifyListeners();
      });
    };

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        title: Text('Avisos'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => model,
          child: ChangeNotifierProvider<AvisosViewModel>(
            create: (context) => model,
            child: Consumer<AvisosViewModel>(
              builder: (context, value, child) {
                if (loading) {
                  loading = false;
                  return ShimmerList();
                } else {
                  if (model.lista.length > 0) {
                    return ListView.builder(
                      itemCount: model.lista.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: ListaAvisoItem(
                                model.lista[index],
                                onCountSelected,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('Nenhum resultado encontrado!'),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Aviso obj = Aviso();
          final information = await Navigator.of(context)
              .pushNamed(PageCadastroAviso.routeName, arguments: obj);
          if (information != null && information == "refresh") {
            onCountSelected();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
