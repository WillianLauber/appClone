import 'package:flutter/material.dart';

class Faturas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Faturas')),
        body: ListView(children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child:  Text('AGOSTO/2020 - R\$ 40,43')),
          ),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child:  Text('SETEMBRO/2020- R\$ 30,23')),
          ),


        ])

    );
  }
}

