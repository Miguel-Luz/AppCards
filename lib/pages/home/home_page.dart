import 'package:call_1807/models/user.dart';
import 'package:call_1807/pages/edit/edit_page.dart';
import 'package:call_1807/pages/items/items_page.dart';
import 'package:call_1807/services/login_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  final _loginService = LoginService();
  final _fakeUser = User(email: '<invalid>', name: '<invalid>');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountEmail: Text('-'),
              accountName: Text('-'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  _fakeUser?.avatarUrl ?? '',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'),
              selected: true,
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text('Itens'),
              onTap: () {
                Navigator.of(context).pushNamed(ItemsPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edição'),
              onTap: () {
                Navigator.of(context).pushNamed(EditPage.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('sair'),
              onTap: () async {
                await _loginService.signOut();
                Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton.icon(
            onPressed: () {
              _key.currentState.openDrawer();
            },
            icon: Icon(Icons.add_circle_outline),
            label: Text('Abrir drawer!')),
      ),
    );
  }
}
