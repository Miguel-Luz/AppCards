import 'package:appcards/models/card.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  static String routeName = '/edit';
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var _form = GlobalKey<FormState>();
  TextEditingController tituloController;
  TextEditingController contentController;
  
  AppCard _card;
  int _carTarget;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _card = ModalRoute.of(context).settings.arguments;
    tituloController = TextEditingController(text: _card.title);
    contentController = TextEditingController(text: _card.content);
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
              TextFormField(controller: tituloController),
              TextFormField(controller: contentController,maxLines: null,
    keyboardType: TextInputType.multiline,),
              Row(children: <Widget>[
                RaisedButton.icon(
                    onPressed: () => _form.currentState.reset(),
                    icon: Icon(Icons.cancel),
                    label: Text('Cancelar'),
                    ),
                RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.update),
                  label: Text('Atualizar'),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
