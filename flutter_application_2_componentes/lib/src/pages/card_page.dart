import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
        backgroundColor: appBarBackground(),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.cyan[600]),
            title: Text("Album de Tarjetas"),
            subtitle: Text("Pequeña descripcion"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(child: Text("Cancelar"), onPressed: (){})
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    //===============================================Forma por defecto=================================================
      return Card(
      //Evita que el contenido salga de la tarjeta 
      clipBehavior: Clip.antiAlias, //Tambien se puede hacer con un container
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
      elevation: 5.0,
      color: Colors.cyan.shade500,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage(
              'https://cdn.hovia.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain.jpg'
            ),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,  //Adapta el contenido a todo el ancho posible
          ),
          // Image(image: NetworkImage('https://cdn.hovia.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain.jpg')
          // ),  //Sin icono de carga
          Container(child: Text("Descripcion de la imagen",style: TextStyle(color: Colors.white),), padding: EdgeInsets.all(10.0)),
        ],
      ),
    );
    //==============================================Forma con container================================================
    // final card = Container(
    //   //Evita que el contenido salga de la tarjeta 
    //   //clipBehavior: Clip.antiAlias, //Tambien se puede hacer con un container
    //   //shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
    //   child: Column(
    //     children: [
    //       FadeInImage(
    //         placeholder: AssetImage('assets/jar-loading.gif'), 
    //         image: NetworkImage(
    //           'https://cdn.hovia.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain.jpg'
    //         ),
    //         fadeInDuration: Duration( milliseconds: 200 ),
    //         height: 300.0,
    //         fit: BoxFit.cover,  //Adapta el contenido a todo el ancho posible
    //       ),
    //       // Image(image: NetworkImage('https://cdn.hovia.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain.jpg')
    //       // ),  //Sin icono de carga
    //       Container(child: Text("Descripcion de la imagen",style: TextStyle(color: Colors.white),), padding: EdgeInsets.all(10.0)),
    //     ],
    //   ),
    // );

    // return Container(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(15.0),
    //     child: card,
    //   ),
    //   decoration: BoxDecoration(
    //     color: Colors.cyan.shade500,
    //     borderRadius: BorderRadius.circular(15.0),
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         color: Colors.black54,
    //         blurRadius: 10.0,  //Difuminar
    //         spreadRadius: 2.0,  //Que tanto se extiende
    //         offset: Offset(2.0,10.0),
    //       ),
    //     ],
    //   ),
    // );
  }
}