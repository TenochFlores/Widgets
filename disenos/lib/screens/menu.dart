import 'package:disenos/screens/stack_column.dart';
import 'package:flutter/material.dart';

import 'basic_design.dart';
import 'compositeHome_design.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  static  String name = "MenuScreen";

  @override
  Widget build(BuildContext context) {

    final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 24);
    
    final Column column = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Bienvenido", style: textStyle),
              SizedBox(height: 20),
              Text(
                "Por favor\nescoja un diseño para visualizar", 
                style: textStyle, 
                textAlign: TextAlign.center
              ),
              SizedBox(height: 60),
              _CustomButton(text: "Basic Design", color: Color.fromARGB(255, 191, 79, 219), screen: BasicDesignScreen.name,),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                // Background color
                primary: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: (){ Navigator.pushNamed(context, StackColumnScreen.name); },
                child: const Text('Stack Column'),
              ),
              SizedBox(height: 20),
              _CustomButton(text: "Composite Design", color: Color.fromARGB(255, 38, 185, 75), screen: CompositeHomeScreen.name)
            ],
          );
          
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: false, title: Text("Menu"), backgroundColor: Color.fromARGB(255, 12, 145, 107)),
        body: _Background(child: column),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  final String text;
  final String screen;
  final Color color;

  const _CustomButton({
    Key? key, required this.text, required this.color, required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () { Navigator.pushNamed(context, screen); },
      child: Text(text), 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color)),
      );
  }
}

class _Background extends StatelessWidget {
  
  final Widget child;

  const _Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final LinearGradient linearGradient = LinearGradient(
      colors: [Color(0xff2E305F),Color(0xff202333)],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      stops: [0.5,1.0]
    );

    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient,
      ),
      constraints: BoxConstraints.expand(),
      child: child,
    );
  }
}