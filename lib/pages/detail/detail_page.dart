import 'package:appcards/services/cards_service.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static String routeName = '/detail';
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   List _car = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _car = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes do item: ',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'car_',
              child: Container(
                color: Colors.white,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInImage(
                    image: NetworkImage(_car ?? ''),
                    placeholder: AssetImage(
                      'assets/loading.gif',
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Hero(
                tag: 'favorite_${_car}',
                child: Icon(
                  Icons.favorite,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            Text(
              _car ?? '',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              _car ?? '',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
