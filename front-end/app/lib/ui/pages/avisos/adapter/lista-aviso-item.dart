import 'package:app/data/domain/aviso.dart';
import 'package:app/ui/pages/avisos/page-cadastro-aviso.dart';
import 'package:flutter/material.dart';

class ListaAvisoItem extends StatelessWidget {
  final Aviso model;
  final VoidCallback onCountSelected;

  ListaAvisoItem(this.model, this.onCountSelected);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Nome: ${model.nome}',
        style: TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '',
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
              .pushNamed(PageCadastroAviso.routeName, arguments: model);
          if (information != null && information == "refresh") {
            onCountSelected();
          }
        },
      ),
    );
  }
}
