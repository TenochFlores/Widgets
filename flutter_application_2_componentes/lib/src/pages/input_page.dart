import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class InputPage extends StatefulWidget {

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> poderes = ['Volar','Rayos X','Super Velocidad','Aliento gelido'];
  TextEditingController _inputFieldDateController = new TextEditingController(); //Para cambiar el texto del TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackground(),
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          //_crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true, //Despliega el teclado automaticamente al entrar
      textCapitalization: TextCapitalization.sentences, //Mayusculas, minusculas y donde
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ), //Quita el borde por defecto ( UnderlineInputBorder() )
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre:',
        helperText: 'Primer nombre y apellidos',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),

      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor; 
        });
      }
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('El email es: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ), //Quita el borde por defecto ( UnderlineInputBorder() )
        hintText: 'example@xmail.com',
        labelText: 'Email:',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),

      ),
      onChanged: (valor) {
        setState(() {
          _email = valor; 
        });
      }
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true, //Formato de contraseña
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ), //Quita el borde por defecto ( UnderlineInputBorder() )
        hintText: 'Password',
        labelText: 'Password:',
        helperText: 'Minimo ocho caracteres con mayusculas y minusculas',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),

      ),
      onChanged: (valor) {
        setState(() {
          _email = valor; 
        });
      }
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false, //Habilita la interaccion
      controller: _inputFieldDateController, //Relaciona el TextField con esa propiedad
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ), //Quita el borde por defecto ( UnderlineInputBorder() )
        hintText: 'DD/MM/AAAA:',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today_sharp),
        icon: Icon(Icons.perm_contact_calendar_rounded),

      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime(2025),
      locale: Locale('es','MX')
    );

    if(picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem> _getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = [];
    poderes.forEach((element) { 
      lista.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.bolt,color: Colors.grey.shade600,),
        SizedBox(width: 30,height: 60), //Espacio
        Expanded( //Expandir todo lo posible el tamaño
          child:DropdownButton<dynamic>(
            isExpanded: true, //La posicion del icono se expande hasta el extremo
            iconSize: 40,
            //=====DropdownButtonFormField en vez de DropdownButton para usar decaoration=====
            //decoration: InputDecoration.collapsed(hintText: '',), //Quitar linea 
            //decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),isCollapsed: true),
            value: _opcionSeleccionada,
            items: _getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
    
    
  }
}