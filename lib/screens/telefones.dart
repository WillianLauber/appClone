import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Telefones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Telefones',
          style: TextStyle(color: Colors.white),
        )),
        body: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[

          Row(children: <Widget>[
            Container(
              height: 50,
              child: const Center(child: Text('Emergência')),
            ),
            Column(children: <Widget>[
              Container(
                height: 50,
                child: new IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => launch("tel://21213123123"),
                  // child: new Text("Ouvidoria")
                ),
                alignment: Alignment.bottomRight,
              ),
            ], crossAxisAlignment: CrossAxisAlignment.end),
          ]),
          const ListTile(
            title: Text('48) 996845948'),
            subtitle: Text('Emergência'),
            trailing: Icon(Icons.call),/* react to the tile being tapped */
          ),
          const ListTile(
            title: Text('48) 996845948'),
            subtitle: Text('Comercial'),
            trailing: Icon(Icons.call),
          )
        ])));
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
