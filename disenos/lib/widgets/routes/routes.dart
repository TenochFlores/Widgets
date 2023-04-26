import 'package:disenos/screens/basic_design.dart';
import 'package:disenos/screens/compositeHome_design.dart';
import 'package:disenos/screens/menu.dart';
import 'package:disenos/screens/stack_column.dart';
import 'package:flutter/material.dart'; 

Map<String,WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
    Menu.name : ( BuildContext context) => Menu(),
    BasicDesignScreen.name : ( BuildContext context) => BasicDesignScreen(),
    StackColumnScreen.name : ( BuildContext context ) => StackColumnScreen(),
    CompositeHomeScreen.name : ( BuildContext context ) =>  CompositeHomeScreen(),
  };
}