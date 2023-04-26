import 'package:disenos/widgets/card_table.dart';
import 'package:flutter/material.dart';

import 'package:disenos/widgets/background.dart';
import 'package:disenos/widgets/navigation_bar.dart';
import 'package:disenos/widgets/TitlePage.dart';

class CompositeHomeScreen extends StatelessWidget {

  static String name = "CompositeHomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: Stack(
        children: [
          Background(),
          _BodyBackground(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[800],
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
   );
  }
}

class _BodyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Titulos
            TitlePage(),
            // Tabla de tarjetas
            CardTable(),
          ],
        ),
      ),
    );
  }
}

