import 'dart:ui';

import 'package:flutter/material.dart';


class StackColumnScreen extends StatelessWidget {

  static String name = "StackColumnScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _boxForGradient(),
        child: PageView(
          physics: BouncingScrollPhysics(), //Efecto al inicio y final 
          scrollDirection: Axis.vertical,
          children: [
            Page1(),
            Page2()   
          ],
        ),
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

  BoxDecoration _boxForGradient() {
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5], // Donde inicia cada color
          colors: [
            Color(0xFF7AECCA),
            Color(0xFF50C2DD),
          ]
        )
      );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),

        Content(),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF50C2DD),
      child: Center(
        child: TextButton( 
          style: TextButton.styleFrom(
            elevation: 10,
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
          ),
          onPressed: () {}, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Text( 
              "Bienvenido", 
               style: TextStyle(color: Colors.white, fontSize: 24)
            ),
          ) 
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40);
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text('11°', style: textStyle),
            Text('Miércoles', style: textStyle),
            Expanded(child: Container()),
            Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white, size: 100,),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF50C2DD),
      height: double.infinity,
      alignment: Alignment.center,
      child: Image( image: AssetImage('assets/scroll-1.png')),
    );
  }
}