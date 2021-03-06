import 'package:flutter/material.dart';

const _tituloAppBar = 'Sobre este aplicativo';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tituloAppBar,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/celesc.png')),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Divider(color: Colors.black),
            ),
            Text('Desenvolvido por Celesc Distribuição S.A'),
            Text('DPTI/DVDS - versão 2.7.0')
          ]),
        ),
      ),
    );
  }
}
