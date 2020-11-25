
import 'package:flutter/material.dart';

class infoServicos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações sobre serviços')),
      body: SingleChildScrollView(  child: Column(
          children: <Widget>[ Text('Troca de titularidade'), Text('Ligação Nova'), Text('Outros Serviços')]),
      ),);
  }
}

