
import 'package:appcards/models/card.dart';
import 'package:appcards/pages/edit/edit_page.dart';
import 'package:flutter/material.dart';

class ComponentCard extends StatefulWidget {
  
  const ComponentCard({ Key key, this.item}) : super(key: key);

  final AppCard item;
  
  @override
  _ComponentCardState createState() => _ComponentCardState();
}

class _ComponentCardState extends State<ComponentCard> {

  @override
  Widget build(BuildContext context) {
    print(widget.item.id);
    return Card(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            title: Text('${widget.item.title}'),
            subtitle: Text('${widget.item.content}'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed:() => edit(widget.item,context),
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed:() => delete(widget.item),
              ),
            ],
          ),
        ],
      ),
    );
   }
  }


  void delete(AppCard item){
    print(item);
  }

 void edit(AppCard item, BuildContext ctx){
     Navigator.of(ctx).pushNamed(EditPage.routeName,arguments: item);
  } 
