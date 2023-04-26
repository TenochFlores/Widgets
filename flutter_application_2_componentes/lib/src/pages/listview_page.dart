import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

import 'dart:async';


class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _numListNOK = [86, 97, 105, 138, 148, 150,190,207,208,209];  //Imagenes que no estan disponibles
  ScrollController _scrollController = ScrollController();  

  List<int>_listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        backgroundColor: appBarBackground(),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(

      onRefresh: _obtenerPagina1,

      child: ListView.builder(
        
        controller: _scrollController,
        itemBuilder: ( BuildContext context, int index ){
          final imagen = _listaNumeros[index];
          if(_numListNOK.indexOf(_listaNumeros[index]) == -1) {
            print('-> El ID "${_listaNumeros[index]}" existe como imagen.');
          } else {
            print('-> El ID "${_listaNumeros[index]}" NO existe como imagen.');
          }                                                          //Intento provisional para solucionar problema
          return (_numListNOK.indexOf(_listaNumeros[index]) == -1)   //con la API, en caso normal solo se regresa la
          ? FadeInImage(                                             //FadeInImage, sin preguntar y sin el container
            placeholder: AssetImage('assets/jar-loading.gif'),       //vacio en caso de fallo
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'), 
            // fadeInDuration: Duration( milliseconds: 200 ), //Duracion de la transicion
            height: 250,
            fit: BoxFit.cover, //Adapta el contenido a todo el ancho posible
          ) : Container();
        },
        itemCount: _listaNumeros.length,
      ),
    );
  }

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);

      setState(() {});
    }
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {  });

    final duration = new Duration( seconds: 2 ); 
    return new Timer( duration, respuestaHTTP );  //Tiempo de espera
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(        //Desplazamos el scroll hacia abajo
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.easeInOutCubic    //La curva de la animacion
    );
    
    _agregar10();
  }

  Widget _crearLoading() {
    if ( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(            // Circulo de carga, linea = LinearProgressIndicator()
                strokeWidth: 6.0, 
                color: Colors.cyan.shade600,        //Detalles de diseño
                backgroundColor: Colors.black54
              ),  
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }

  }

  Future<Null> _obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);  // Arregla el que no aparezcan de manera inmediata
  }
}