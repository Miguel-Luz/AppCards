import 'package:appcards/models/card.dart';
//import '../../pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:appcards/services/cards_service.dart';
import 'package:provider/provider.dart';


class ItemsPage extends StatefulWidget {
  static String routeName = '/items';
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<AppCard> _cards = [];
  CardsService _handleCars;
   
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleCars = Provider.of<CardsService>(context);
   //_cards = _handleCars.getAll();
  }

/* 
void getAllCards() async {
//_cards = await _handleCars.getAll();

} */

  @override
  Widget build(BuildContext context) {
    print(_handleCars.getAll());
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Text('dqdqdw'),
        ),
      );
    
  }
}
