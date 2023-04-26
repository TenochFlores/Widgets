import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UIProvider>(context);
    final int currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOption = i,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map), 
          label: 'Mapa'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Direcciones'
        ),
    ]);
  }
}