import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class BasicDesignScreen extends StatelessWidget {

  static String name = "BasicDesignScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/landscape.jpg')),
          
          EtiquetaCalificacion(),

          ButtonSection(),

          Paragraph()
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

class Paragraph extends StatelessWidget {
  const Paragraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text( "Labore nulla enim elit dolor amet cillum laborum duis id nisi aliqua ullamco ex cillum. Sunt excepteur cupidatat ex sunt pariatur quis est veniam eu aliqua commodo mollit dolor aliqua. Id ipsum do aliqua commodo eiusmod proident aliqua aute eiusmod ea enim sint eiusmod.Excepteur ullamco dolor sint ex incididunt excepteur. Sunt non eu cillum minim ullamco. Id eu eiusmod laboris ullamco est aute cillum aute qui esse occaecat consequat. Quis elit eiusmod incididunt minim.")
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getButton(Icons.phone, "CALL"),
          _getButton(Icons.map, "ROUTE"),
          _getButton(Icons.share, "SHARE"),
        ],
      )
    );
  }

  Column _getButton(IconData icon, String title) {
    return Column(
      children: [
        IconButton(onPressed: _onPressedAction, icon: Icon(icon, color: Colors.blue), ),
        Text(title, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

class EtiquetaCalificacion extends StatelessWidget {
  const EtiquetaCalificacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row( 
        children: [    
          Column(
            children: [
              Text("Oeschinen Lake Campground", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Candersteg, Switzerland", style: TextStyle(color: Colors.black45)),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),

          Expanded(child: Container()),

          Icon(Icons.star, color: Colors.red,),

          Text("41"),
        ]
      ),
    );
  }
}

void _onPressedAction(){
  
} 