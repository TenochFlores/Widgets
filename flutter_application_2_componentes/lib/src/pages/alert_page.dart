import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
        backgroundColor: appBarBackground(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Mostrar alerta'),
              onPressed: () => _mostrarAlerta(context),    
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: StadiumBorder()
              ),
            ),
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

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
          title: Text("Gestion de alertas"),
          content: Column(
            mainAxisSize: MainAxisSize.min, //Ajusta la etiqueta al tamaño minimo posible
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo( size: 100.0 ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(),child: Text('Cancelar')),
            TextButton(onPressed: () => Navigator.of(context).pop(),child: Text('Ok')),
          ],
        );
      },
      barrierDismissible: true,
    );
  }
}