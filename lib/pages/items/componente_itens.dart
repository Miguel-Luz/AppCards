
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
      return Card(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            title: Text('${widget.item.title}'),
            subtitle: Text('${widget.item.content}'),
            dense:true ,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                icon:Icon(Icons.edit),
                label:  Text('Editar'),
                onPressed:() => edit(widget.item,context),
              ),
              FlatButton.icon(
                icon:Icon(Icons.delete),
                label:  Text('Excluir'),
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
