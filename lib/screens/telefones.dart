
import 'package:flutter/material.dart';

class telefones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telefones')),
      body: SingleChildScrollView(  child: Column(
          children: <Widget>[
            Image.asset('assets/pic1.jpg'), Text('Desenvolvido por Celesc Distribuição S.A'), Text('DPTI/DVDS - versão 2.7.0')]),
      ),);
  }
}

