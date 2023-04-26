import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class TitlePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(left: 25, top: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StylizedText('Classify transaction', 32), // Clase ya con un formato especifico
            SizedBox(height: 10),
            _StylizedText('Classify this transaction into a\nparticular category', 16)
          ],
        ),
      ),
    );
  }
}

class _StylizedText extends StatelessWidget {

  late String _string; 
  late double _fontSize;

  _StylizedText(String string, double fontSize){
    this._string = string;
    this._fontSize = fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text( _string, style: TextStyle(fontSize: _fontSize, color: Colors.white) );
  }
}