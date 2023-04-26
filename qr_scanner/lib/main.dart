import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UIProvider()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'QRScanner',
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => HomePage(),
          'map'  : ( _ ) => MapPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ).copyWith(
            secondary: Colors.teal,
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
        ),

      ),
    );
  }
}