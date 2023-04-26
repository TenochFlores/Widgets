import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 180.0;
  bool _bloquearCheck = false;
  bool _bloquearCheck2 = false;
  bool _visibilidadDeImagen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackground(),
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
        child: Column(
          children: [
            
            _crearCheckBox(),    //Con Container
            //_crearCheckBox2(), //CheckBox simple y CheckBox completa sin Container
            _crearSwitch(),
            _crearSlider(),
            Expanded(child: _crearImagen()),
            _crearNombre(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.green.shade700,
      label: _valorSlider.toInt().toString(),//'Tamaño de la imagen',
      // divisions: 10,         //Divide la barra
      value: _valorSlider, 
      min: 25.0,
      max: 205.0,
      onChanged: (_bloquearCheck) ? null :  ( valor ){
        setState(() {
          _valorSlider = valor; 
        });
      }
    );
  }

  Widget _crearImagen() {
    return Visibility(
      child: FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        image: NetworkImage('https://nintheorist.files.wordpress.com/2017/07/zelda_botw_the-champions-ballad_1.png?w=1140'),
        width: _valorSlider,
        fit: BoxFit.contain,
      ),
      visible: _visibilidadDeImagen,
    );
  }

  Widget _crearNombre(){
    return Container(
      child: Center(child: Text('Link', style: TextStyle(fontSize: 50.0),)),
      margin: EdgeInsets.only(left: 100.0, right: 100.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.cyan[100],
        border: Border.all(color: Colors.cyan.shade700, width: 3.0),
        boxShadow: <BoxShadow>[ //Relieve (Sombras)
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,  //Difuminar
            spreadRadius: 1.0,  //Que tanto se extiende
            offset: Offset(2.0,10.0),
          ),
        ],  
      ),
    );
  }

  Widget _crearCheckBox() {
    return Container(
        child: CheckboxListTile(
        title: Text('Deshabilitar escalado'),
        value: _bloquearCheck, 
        onChanged: ( valor ){
          setState(() {
            _bloquearCheck = valor!;
          });
        },
        activeColor: Colors.white,
        checkColor: Colors.cyan[800],
        secondary: Icon(Icons.stop_circle_outlined),
        controlAffinity: ListTileControlAffinity.leading, //Posicion del CheckBox
        contentPadding: EdgeInsets.only(left: 25.0, right:25.0), //Espaciado entre otros componentes
        selected: true,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius: BorderRadius.circular(10.0), 
        color: Colors.yellow[800],
        boxShadow: <BoxShadow>[ //Relieve (Sombras)
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,  //Difuminar
            spreadRadius: 2.0,  //Que tanto se extiende
            offset: Offset(2.0,10.0),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10,right:10, top: 5, bottom: 3),
      clipBehavior: Clip.antiAlias,
    );
  }

  Widget _crearCheckBox2() {
    //========================================= CheckBox simple ======================================================= 
    // return Checkbox(
    //   value: _bloquearCheck, 
    //   onChanged: ( valor ){
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
    //   }
    // );

    //=================================== Con diseño pero sin Container ======================================================= 
    return CheckboxListTile(
        title: Text('Deshabilitar escalado'),
        value: _bloquearCheck2, 
        onChanged: ( valor ){
          setState(() {
            _bloquearCheck2 = valor!;
          });
        },
        activeColor: Colors.white,
        checkColor: Colors.cyan[800],
        secondary: Icon(Icons.stop_circle_outlined),
        controlAffinity: ListTileControlAffinity.leading, //Posicion del CheckBox
        contentPadding: EdgeInsets.only(left: 30.0, right:30.0), //Espaciado entre otros componentes
        selected: true,
        tileColor: Colors.orange,
        selectedTileColor: Colors.blueGrey,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
      
      );
  }

  Widget _crearSwitch() {
    return Container(
        child: SwitchListTile(
        title: Text('Mostrar imagen'),
        value: _visibilidadDeImagen, 
        onChanged: ( valor ){
          setState(() {
            _visibilidadDeImagen = valor;
          });
        },
        activeColor: Colors.white,
        secondary: Icon(Icons.stop_circle_outlined),
        controlAffinity: ListTileControlAffinity.leading, //Posicion del CheckBox
        contentPadding: EdgeInsets.only(left: 25.0, right:25.0), //Espaciado entre otros componentes
        selected: true,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius: BorderRadius.circular(10.0), 
        color: Colors.yellow[800],
        boxShadow: <BoxShadow>[ //Relieve (Sombras)
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,  //Difuminar
            spreadRadius: 2.0,  //Que tanto se extiende
            offset: Offset(2.0,10.0),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10,right:10, top: 5, bottom: 3),
      clipBehavior: Clip.antiAlias,
    );
  }
}