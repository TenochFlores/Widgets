import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scanner_model.dart';

import 'package:qr_scanner/widgets/custom_navigationbar.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/pages/directions_page.dart';
import 'package:qr_scanner/pages/map_history_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/scanner_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final auxScan = ScannerModel(valor: 'https://reddit.com', id: 3);

    // ======================================== Operaciones basicas de la BDD ========================================

    /* Insercion de registros */
    // DBProvider.dbProvider.nuevoScan(auxScan);

    /* Lectura de registros */
    DBProvider.dbProvider.getScanById(5).then( (scan) => print("Valor obtenido del id ${scan?.id}: ${scan!.valor}") );
    DBProvider.dbProvider.getAllScans().then( print );
    DBProvider.dbProvider.getScansByType('https').then( print );

    // Actualizacion de registros
    // DBProvider.dbProvider.updateScan( auxScan );

    // ================================================================================================================

    final uiProvider = Provider.of<UIProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOption;

    switch( currentIndex ){
      case 0: 
        return const MapHistory();

      case 1:
        return const DirectionsPage();

      default: 
        return const MapHistory();
    }
  }
}