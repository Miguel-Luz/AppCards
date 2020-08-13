import 'package:appcards/controllers/auth_controller.dart';
import 'package:appcards/models/user.dart';
import 'package:appcards/pages/edit/edit_page.dart';
import 'package:appcards/pages/items/items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
class ComponenteDrawer extends StatefulWidget {
    
  @override
  _ComponenteDrawerState createState() => _ComponenteDrawerState();
}

class _ComponenteDrawerState extends State<ComponenteDrawer> {
   AuthController _authController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authController = Provider.of<AuthController>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Observer(
              builder: (context) {
                var _user = User(
                  email: _authController.appState.email,
                  name: _authController.appState.email.split('@')[0],
                );
                return UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  accountEmail: Text(_user.email),
                  accountName: Text(_user.name),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      _user?.avatarUrl ?? '',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'),
              onTap: () {
                Navigator.of(context).pushNamed(ItemsPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_to_queue),
              title: Text('Incluir Card'),
              onTap: () {
                Navigator.of(context).pushNamed(EditPage.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('sair'),
              onTap: () {
                _authController.signOut();
              },
            ),
          ],
        ),
      );
}
}