import 'package:app/data/domain/veiculo.dart';
import 'package:app/ui/pages/veiculos/page-cadastro-veiculo.dart';
import 'package:flutter/material.dart';

class ListaVeiculoItem extends StatelessWidget {
  final Veiculo model;
  final VoidCallback onCountSelected;

  ListaVeiculoItem(this.model, this.onCountSelected);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Modelo: ${model.modelo} / Marca: ${model.marca}',
        style: TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        'Placa: ${model.placa} / Ano: ${model.ano}',
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.green,
          size: 30,
        ),
        onPressed: () async {
          final information = await Navigator.of(context)
              .pushNamed(PageCadastroVeiculo.routeName, arguments: model);
          if (information != null && information == "refresh") {
            onCountSelected();
          }
        },
      ),
    );
  }
}
