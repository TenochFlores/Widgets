import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final List<String> opciones = ['Uno','Dos','Tres','Cuatro','Cinco']; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = [];

    for (String i in opciones) {
      final tempWidget = ListTile(
        title: Text(i),
      );

      lista..add(tempWidget)
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){
    return opciones.map(( item ) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Nuevo titulo"),
            leading: Icon(Icons.access_alarms_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }

}