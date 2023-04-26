import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(icon: Icons.window, initialColor: Color(0xffaed0f9),finalColor: Color(0xff2f97e6), text: "General",),
            _SingleCard(icon: Icons.directions_bus, initialColor: Color(0xffb491f5),finalColor: Color(0xff7457e4), text: "Transport",),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.shopping_bag, initialColor: Color(0xfffc98f0),finalColor: Color(0xfffa44d0), text: "Shopping",),
            _SingleCard(icon: Icons.sticky_note_2, initialColor: Color(0xfffec39f),finalColor: Color(0xffff883f), text: "Bills",),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.movie, initialColor: Color(0xff79acff),finalColor: Color(0xff4f71f4), text: "Entertainment",),
            _SingleCard(icon: Icons.fastfood, initialColor: Color(0xff8cf795),finalColor: Color(0xff2bdc73), text: "Grosery",),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData icon; 
  final Color initialColor;
  final Color finalColor;
  final String text;

  const _SingleCard(
    {Key? key, 
    required this.icon, 
    required this.initialColor, 
    required this.finalColor, 
    required this.text,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    final LinearGradient linearGradientCircleAvatar = LinearGradient(
      colors: <Color>[initialColor, finalColor],
      begin: Alignment.topLeft, 
      end: Alignment.bottomRight,
      stops: [0.0, 0.7],
    );

    final LinearGradient linearGradientText = LinearGradient(
      colors: <Color>[initialColor, finalColor],
      stops: [0.0, 0.7],
    );

    final Container circleAvatar = Container(
          decoration: BoxDecoration(
            gradient: linearGradientCircleAvatar,
            shape: BoxShape.circle
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(icon),
          ));

    final Column column = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleAvatar,
                SizedBox(height: 20),
                Text(
                  text, 
                  style: TextStyle( 
                    fontSize: 18, 
                    foreground: Paint()..shader = linearGradientText.createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  ),
                ),
              ],
            );
    
    return _CardBackground(child: column);
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final BoxDecoration boxDecoration = BoxDecoration(
        color: Color.fromRGBO(94, 96, 129, 0.7),
        borderRadius: BorderRadius.circular(20.0)
    );

    return Container( // Necesario para aplicar el blur unicamente ya a todo el bloque
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ClipRRect( // Mantien al blur contenido y que no se expanda
        child: BackdropFilter( // Necesario para hacer el blur
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container( 
            height: 180,
            decoration: boxDecoration,
            child: child,
          ),
        ),
      ),
    );
  }
}