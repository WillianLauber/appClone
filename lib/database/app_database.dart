import 'package:flutter/widgets.dart';

import '../models/UnidadeConsumidora.dart';
import 'package:celesc_app/models/UnidadeConsumidora.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE UnidadesConsumidoras('
          'numero INTEGER PRIMARY KEY,'
          'documento INTEGER,'
          'data_nasc TEXT,'
          'apelido TEXT)');
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  });
}

Future<int> save(UnidadeConsumidora unidadeConsumidora) {
  debugPrint(unidadeConsumidora.toString());
  return createDatabase().then((db) {
    final Map<String, dynamic> UnidadeConsumidoraMap = Map();
    UnidadeConsumidoraMap['numero'] = unidadeConsumidora.numero;
    UnidadeConsumidoraMap['documento'] = unidadeConsumidora.documento;
    UnidadeConsumidoraMap['data_nasc'] = unidadeConsumidora.dataNascCliente;
    UnidadeConsumidoraMap['apelido'] = unidadeConsumidora.apelido;
    return db.insert('UnidadesConsumidoras', UnidadeConsumidoraMap);
  });
}

Future<List<UnidadeConsumidora>> findAll() {
  return createDatabase().then((db) => db.query('UnidadesConsumidoras').then((maps) {
        final List<UnidadeConsumidora> uconsumidoras = List();
        for (Map<String, dynamic> map in maps) {
          final UnidadeConsumidora unidadeConsumidora = UnidadeConsumidora(
              map['numero'], map['documento'], map['data_nasc'], map['apelido']);
          print('olha eu ai' + unidadeConsumidora.toString());
          uconsumidoras.add(unidadeConsumidora);
        }
        return uconsumidoras;
      }));
}
