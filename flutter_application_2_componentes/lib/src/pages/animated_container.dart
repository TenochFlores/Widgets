import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {

  double _width  = 50.0;
  double _height = 50.0;
  Color  _color  = Colors.lightGreen.shade800;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Content'),
        backgroundColor: appBarBackground(),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500), //De la animacion
          curve: Curves.decelerate, //Animaciones provistas por Flutter
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outlined), 
        backgroundColor: Colors.cyan.shade800,
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma(){
    final Random random = Random();

    setState(() {
      _width  = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color  = Color.fromRGBO(
        random.nextInt(255), // r
        random.nextInt(255), // g
        random.nextInt(255), // b
        1                    // Opacity
      );
      _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}