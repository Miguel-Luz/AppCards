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
      
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.item.title,
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
            Divider(
              height: 4.0,
            ),
            Text(widget.item.content),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange[800],
            width: 1.0,
          ),
        ),
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

  void edit(AppCard item, BuildContext ctx) async {
    await Navigator.of(ctx).pushNamed(EditPage.routeName, arguments: item);
    _handleCards.setListCards();
  }
}
