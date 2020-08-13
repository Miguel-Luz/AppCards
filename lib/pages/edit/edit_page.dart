import 'package:appcards/controllers/cards_controller.dart';
import 'package:appcards/models/card.dart';
import 'package:appcards/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  static String routeName = '/edit';
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
GlobalKey<FormState> _form = GlobalKey<FormState>();
CardsController _handleCards;
AppCard _card = AppCard();
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _card = ModalRoute.of(context).settings.arguments ?? _card;
    _handleCards = Provider.of<CardsController>(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edição',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _card?.title,
                
                maxLines: 3,
                validator:(value) => Validation.isRequired(value),
                onSaved:(value) => _card?.title = value,
              ),
              TextFormField(
                initialValue: _card?.content,
               
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator:(value) => Validation.isRequired(value),
                onSaved:(value) => _card?.content = value,
              ),
              Row(children: <Widget>[
                RaisedButton.icon(
                  onPressed: () => _form.currentState.reset(),
                  icon: Icon(Icons.cancel),
                  label: Text('Cancelar'),
                ),
                RaisedButton.icon(
                  onPressed:() => _onSaved(),
                  icon: Icon(Icons.update),
                  label: Text('Salvar'),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  
 void _onSaved(){
  if(_form.currentState.validate()){
     _form.currentState.save();
   
   if(_card?.id == null ){
     _handleCards.insertCard(_card);
     
     Navigator.pop(context);
   }else{
      _handleCards.updateCard(_card);
     
   }
  }
 }
 
 
 
 }



 
