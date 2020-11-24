import 'package:celesc_app/database/app_database.dart';
import 'package:celesc_app/main.dart';
import 'package:celesc_app/models/UnidadeConsumidora.dart';
import 'package:flutter/material.dart';

final TextEditingController _numeroController = TextEditingController();
final TextEditingController _documentoController = TextEditingController();
final TextEditingController _dataNascController = TextEditingController();
final TextEditingController _apelidoController = TextEditingController();

class Cadastro extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar unidade consumidora',
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Documento',
                ),
                controller: _documentoController,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Número',
                ),
                controller: _numeroController,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Apelido',
                ),
                controller: _apelidoController,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                    child: Text('Create'),
                    onPressed: () {
                      debugPrintStack(label: 'lkj');
                      final String datanasc = _dataNascController.text;
                      final int number = int.tryParse(_numeroController.text);
                      final String apelido = _apelidoController.text;
                      final int documento =
                          int.tryParse(_documentoController.text);
                      debugPrint(unidadeConsummidora.toString());
                      final contact = new UnidadeConsumidora(
                          number, documento, datanasc, apelido);
                      save(contact).then((numero) => Navigator.pop(context));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
