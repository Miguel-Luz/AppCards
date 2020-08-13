import 'package:appcards/controllers/cards_controller.dart';
import 'package:appcards/pages/items/componente_itens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  static String routeName = '/items';
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  CardsController _handleCards;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _handleCards = Provider.of<CardsController>(context);
    _handleCards.setCards();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Observer(builder: (_) {
          return ListView.builder(
            itemCount: _handleCards.cards.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ComponentCard(item: _handleCards.cards[index]),
              );
            },
          );
        }),
      ),
    );
  }
}
