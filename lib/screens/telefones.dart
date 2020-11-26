import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Telefones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Telefones',
          style: TextStyle(color: Colors.white),
        )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Card(
              child: ListTile(
            trailing: Icon(Icons.call),
            title: Text("Emergência - (48) 9903-3939"),
            onTap: () {
              launch("tel://21213123123");
            },
          )), //PDFCreator
          Card(
              child: ListTile(
            trailing: Icon(Icons.call),
            title: Text("Comercial - (48) 9902-3939"),
            onTap: () {
              launch("tel://21213123123");
            },
          )),
          Card(
              child: ListTile(
            trailing: Icon(Icons.call),
            title: Text("Ouvidoria - (48) 9902-3939"),
            onTap: () {
              launch("tel://21213123123");
            },
          )),
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
