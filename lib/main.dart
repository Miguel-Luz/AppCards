import 'controllers/auth_controller.dart';
import 'data/mock_data.dart';
//import 'pages/detail/detail_page.dart';
import 'pages/edit/edit_page.dart';
import 'pages/home/home_page.dart';
import 'pages/items/items_page.dart';
import 'pages/login/login_page.dart';
import 'services/app_state_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        Provider<AuthController>(
          create: (_) =>
              AuthController(appStateRepository: AppStateRepository())
                ..getCurrent(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);

    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) {
          return Observer(
            builder: (context) {
              if (controller.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!controller.isLogedIn) {
                return LoginPage();
              }
              return HomePage();
            },
          );
        },
      
        ItemsPage.routeName: (context) => Provider(
              create: (_) => MockData.cars,
              child: ItemsPage(),
            ),
        EditPage.routeName: (context) => EditPage(),
      },
    );
  }
}
