import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _nConta = 'Número da conta';
const _valor = 'valor';
const _tconfirmar = 'confirmar';

class sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre este aplicativo')),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/celesc.png')),
          Text('Desenvolvido por Celesc Distribuição S.A'),
          Text('DPTI/DVDS - versão 2.7.0')
        ]),
      ),
    );
  }
}
