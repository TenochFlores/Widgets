import 'package:disenos/screens/menu.dart';
import 'package:disenos/widgets/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );
    // Cambiar mas opciones como color, brillo, etc.
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.redAccent) );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "menu",
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        print("======================= ${settings.name} =========================");
        return MaterialPageRoute(builder: (context) => Menu());
      },
    );
  }
}

