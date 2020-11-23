import '../models/UnidadeConsumidora.dart';
import 'package:celesc_app/models/UnidadeConsumidora.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE UnidadeConsumidoras('
          'numero INTEGER PRIMARY KEY,'
          'documento INTEGER,'
          'data_nasc TEXT,'
          'apelido TEXT)');
    }, version: 2, onDowngrade: onDatabaseDowngradeDelete);
  });
}

Future<int> save(UnidadeConsumidora unidadeConsumidora) {
  return createDatabase().then((db) {
    final Map<String, dynamic>  UnidadeConsumidoraMap = Map();
    UnidadeConsumidoraMap['numero'] = unidadeConsumidora.numero;
    UnidadeConsumidoraMap['documento'] = unidadeConsumidora.documento;
    UnidadeConsumidoraMap['data_nasc'] =
        unidadeConsumidora.dataNascCliente;
    UnidadeConsumidoraMap['apelido'] =
        unidadeConsumidora.apelido;
    return db.insert('UnidadeConsumidoras', UnidadeConsumidoraMap);
  });
}

Future<UnidadeConsumidora> find() {
  var UnidadeConsumidoras;
  return createDatabase()
      .then((db) => db.query('UnidadeConsumidoras').then((maps) {
            for (Map<String, dynamic> map in maps) {
              final UnidadeConsumidora unidadeConsumidora = UnidadeConsumidora(map['numero'], map['documento'], map['data_nasc'], map['apelido']);

              UnidadeConsumidoras = unidadeConsumidora;
            }
            return UnidadeConsumidoras;
          }));
}
