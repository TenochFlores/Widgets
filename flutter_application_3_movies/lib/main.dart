import 'package:flutter_application_3_movies/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_3_movies/providers/movies_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false),  //Lazy = Creacion perezosa, con false manda a llamar el contructor inmediatamente
      ],
      child: MyApp(),  //Llamamos a myApp de esta manera en runApp() se tiene antes a AppState y despues a MyApp
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'details' : ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme( color: Colors.black12 ) //deepPurpleAccent[700]
      ),
    );
  }
}