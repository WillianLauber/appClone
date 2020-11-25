
import 'package:flutter/material.dart';

class telefones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telefones')),
      body: SingleChildScrollView(  child: Column(
          children: <Widget>[ Text('(48) 996845948 - emergências'), Text('(49) 94994-3443 - informações sobre serviços')]),
      ),);
  }
}

