import 'package:appcards/controllers/cards_controller.dart';
import 'package:appcards/models/card.dart';
import 'package:appcards/pages/edit/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentCard extends StatefulWidget {
  const ComponentCard({Key key, this.item}) : super(key: key);

  final AppCard item;

  @override
  _ComponentCardState createState() => _ComponentCardState();
}

class _ComponentCardState extends State<ComponentCard> {
  CardsController _handleCards;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleCards = Provider.of<CardsController>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(widget.item.title),
            subtitle: Text(widget.item.content),
            dense: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Editar'),
                onPressed: () => edit(widget.item, context),
              ),
              FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Excluir'),
                onPressed: () => delete(widget.item),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void delete(AppCard item) async {
    void deleteAction(bool value) {
      if (value == true) {
        _handleCards.deleteCard(widget.item.id);
      }
      Navigator.pop(context);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alerta!"),
          content: ListTile(
            title: Text('Confirma a exclusão do Card!'),
            subtitle: Text('Titulo: ${item.title}'),
          ),
          actions: [
            FlatButton(
              onPressed: () => deleteAction(false),
              child: Text('Não'),
            ),
            FlatButton(
              onPressed: () => deleteAction(true),
              child: Text('Sim'),
            )
          ],
        );
      },
    );
  }

  void edit(AppCard item, BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EditPage.routeName, arguments: item);
  }
}
