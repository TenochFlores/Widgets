import 'package:flutter/material.dart';

import 'package:flutter_application_2_componentes/src/pages/alert_page.dart';
import 'package:flutter_application_2_componentes/src/pages/animated_container.dart';
import 'package:flutter_application_2_componentes/src/pages/avatar_page.dart';
import 'package:flutter_application_2_componentes/src/pages/home_page.dart';
import 'package:flutter_application_2_componentes/src/pages/input_page.dart';
import 'package:flutter_application_2_componentes/src/pages/listview_page.dart';
import 'package:flutter_application_2_componentes/src/pages/slider_page.dart';

Map<String,WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
    '/'     : ( BuildContext context) => HomePage(),
    'alert' : ( BuildContext context) => AlertPage(),
    AvatarPage.pageName: ( BuildContext context) => AvatarPage(),
    'animatedContainer': ( BuildContext context) => AnimatedContainerPage(),
    'inputs': ( BuildContext context) => InputPage(),
    'slider': ( BuildContext context ) => SliderPage(),
    'listview': ( BuildContext context ) => ListaPage(),
  };
}

