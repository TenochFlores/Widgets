import 'package:flutter/material.dart';

import 'package:flutter_application_2_componentes/src/providers/menu_provider.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Componentes"),
        backgroundColor: appBarBackground(),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],  
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
 
        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }
 
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems( List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    data?.forEach((opt) { 
      final tempWidget = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.cyan[600]),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
          //Forma alternativa
          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );
          // Navigator.push(context, route);
        },
      );

      opciones..add(tempWidget)
              ..add(Divider());
    });

    return opciones;
  }
}