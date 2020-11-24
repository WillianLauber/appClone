import 'package:celesc_app/database/app_database.dart';
import 'package:celesc_app/models/UnidadeConsumidora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'cadastro.dart';

final List<UnidadeConsumidora> uconsumidoras = List();

class ListaUnidadesConsumidoras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas unidades consumidoras',
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: FutureBuilder<List<UnidadeConsumidora>>(
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
              break;
            case ConnectionState
                .active: //quando está com 50% dos dados carregados, as vezes faz sentido já mostarr, no nosso caso não
              break;
            case ConnectionState.done:
              debugPrint('conexão terminou, dentro do builder');
              final List<UnidadeConsumidora> uconsumidoras = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final UnidadeConsumidora unidadeConsumidora =
                      uconsumidoras[index];
                  debugPrint(unidadeConsumidora.toString());
                  return _ContactItem(unidadeConsumidora);
                },
                itemCount: uconsumidoras.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Cadastro()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final UnidadeConsumidora unidadeConsumidora;

  _ContactItem(this.unidadeConsumidora);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(unidadeConsumidora.apelido),
        subtitle: Text(unidadeConsumidora.documento.toString()),
      ),
    );
  }
}
