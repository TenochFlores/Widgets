import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final purpleGradient = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.7], //Comienzos del gradiente
            colors: [
              Color(0xff2E305F),
              Color(0xff202333),
            ]
          ),
        );

    return Stack(
      children: [ 
        // Gradient background
        Container( decoration: purpleGradient ),
        _PinkBox(),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
    const _PinkBox({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Positioned(
        top: -100,
        left: -30,
        child: Transform.rotate(
          angle: -0.8,
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                stops: [0.0, 0.9],
                colors: [
                  Color.fromRGBO(236, 98, 188, 1),
                  Color.fromRGBO(241, 142, 172, 1),
                ],
              ),
            ),
          ),
        ),
      );
    }
}