import 'package:app/data/domain/veiculo.dart';
import 'package:app/data/service/service-locator.dart';
import 'package:app/ui/pages/shimmer/lista-shimmer.dart';
import 'package:app/ui/pages/veiculos/adapter/lista-veiculo-item.dart';
import 'package:app/ui/pages/veiculos/page-cadastro-veiculo.dart';
import 'package:app/ui/pages/veiculos/veiculo-view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageVeiculo extends StatefulWidget {
  static const routeName = '/veiculos';

  @override
  _PageVeiculo createState() => _PageVeiculo();
}

class _PageVeiculo extends State<PageVeiculo> {
  VeiculoViewModel model = getIt<VeiculoViewModel>();

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
        title: Text('Veiculos'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => model,
          child: ChangeNotifierProvider<VeiculoViewModel>(
            create: (context) => model,
            child: Consumer<VeiculoViewModel>(
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
                              child: ListaVeiculoItem(
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
          Veiculo obj = Veiculo();
          final information = await Navigator.of(context)
              .pushNamed(PageCadastroVeiculo.routeName, arguments: obj);
          if (information != null && information == "refresh") {
            onCountSelected();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
