import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scanner_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static Database? _dataBase;
  static final DBProvider dbProvider = DBProvider._();

  DBProvider._();

  Future<Database?> get dataBase async {
    if( _dataBase != null ) return _dataBase;

    _dataBase = await initDB();
    
    return _dataBase!;
  } 


  Future<Database> initDB() async {

    // Path de donde almacenaremos la BDD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');  

    print(path);

    // Creacion BDD
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){}, //Si se quiere ejecutar algo al abrirla
      onCreate: (Database db, int version) async {
        
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      }
    );
  }

  // Inserta el row de manera manual
  Future<int> nuevoScanRow( ScannerModel newScan ) async {

    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    // Verificamos la BDD
    final db = await dataBase;
    //Insertamos 
    final answer = await db!.rawInsert('''
      INSERT INTO Scans ( id, tipo, valor ) 
      VALUES ( $id, '$tipo', '$valor' )
    ''');
    
    return answer;
  }
  
  Future<int> nuevoScan( ScannerModel newModel ) async {

    // Verificamos la BDD
    final db = await dataBase;
    //Insertamos, el metodo recibe la tabla a la que se va a insertar
    // y un mapa con los datos
    final answer = await db!.insert('Scans', newModel.toJson() );

    print(answer);
    return answer;
  }

  Future<ScannerModel?> getScanById( int id ) async {

      final db     = await dataBase;
      final answer = await db!.query('Scans',
                                    where: 'id = ?',
                                    whereArgs: [id]);

      return answer.isNotEmpty
          ? ScannerModel.fromJson(answer.first)
          : null;
  }

  Future<List<ScannerModel>?> getAllScans() async {

    final db     = await dataBase;
    final answer = await db!.query('Scans');

    return answer.isNotEmpty
        ? answer.map( (s) => ScannerModel.fromJson(s) ).toList()
        : [];
  }

  Future<List<ScannerModel>?> getScansByType( String type ) async {

    final db     = await dataBase;
    // Utilizamos rowQuery para aprender otra forma
    final answer = await db!.rawQuery('''
      SELECT * FROM Scans where tipo = '$type'
    ''');

    return answer.isNotEmpty
        ? answer.map( (s) => ScannerModel.fromJson(s) ).toList()
        : [];
  }

  Future<int> updateScan( ScannerModel newScanner ) async {
    final db = await dataBase;
    final answer = db!.update('Scans', newScanner.toJson(),
                              where: 'id = ?',
                              whereArgs: [ newScanner.id ]);

    // Tambien hay opcion de utilizar un rowUpdate y hacerlo manualmente
    // como en el metodo getScansByType.

    return answer;
  }

  Future<int> deleteScan( int id ) async {
    final db = await dataBase;
    final answer = db!.delete('Scans', where: 'id = ?', whereArgs: [ id ]);
    return answer;
  }

  Future<int> deleteAllScans() async {
    final db = await dataBase;
    final answer = db!.delete('Scans');

    // Otra posibilidad
    /*
    * final answer = db!.delete('''
    *   DELETE FROM Scans
    * ''');
    */

    return answer;
  }
}