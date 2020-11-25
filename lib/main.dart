import 'dart:io';
import 'package:celesc_app/screens/cadastro.dart';
import 'package:celesc_app/screens/faturas.dart';
import 'package:celesc_app/screens/lista.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:celesc_app/report_pdf.dart';
import 'package:celesc_app/screens/sobre.dart';

import 'database/app_database.dart';

// ignore: avoid_web_libraries_in_flutter
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

int unidadeConsummidora = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          // bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
        accentTextTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          // bodyColor: Colors.white,
          displayColor: Colors.white,
        ),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Celesc',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    future:
    findAll();
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                showDialog();
              },
            ),
            showMenu(context),
            //  child: IconButton( icon: Icon(
            //     MyIcon.edit,
            //     // color: Colors.white,
            //     size: 35, color: Colors.white,
            //   ),onPressed: _buildLayoutContainer,
            //  ),
          ]),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the pare$Rnt.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.fill,
                ),
                // shape: BoxShape.circle, para deixá-lo quadrado
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => faturas()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              color: Colors.black12,
                              width: 110,
                              height: 120,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Icon(Icons.assignment_outlined,
                                          color: Colors.white, size: 60.0),
                                    ),
                                    Center(
                                        child: Text(
                                      'Faturas em aberto',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                                  ]),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 8),
                        child: Container(
                            padding: EdgeInsets.only(top: 8.0),
                            color: Colors.black12,
                            width: 110,
                            height: 120,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(Icons.bar_chart_outlined,
                                        color: Colors.white, size: 52.0),
                                  ),
                                  Text(
                                    'Histórico de consumo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black12,
                            width: 110,
                            height: 120,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(Icons.assignment_late_outlined,
                                        color: Colors.white, size: 52.0),
                                  ),
                                  Text(
                                    'Relatar falta de energia',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 8.0),
                          color: Colors.black12,
                          width: 110,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.calendar_today_outlined,
                                      color: Colors.white, size: 50.0),
                                  Center(
                                      child: Text(
                                    'Desligamentos programados',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                                ]),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 8),
                        child: Container(
                            padding: EdgeInsets.only(top: 8.0),
                            color: Colors.black12,
                            width: 110,
                            height: 120,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(Icons.lightbulb_outline_rounded,
                                        color: Colors.white, size: 50.0),
                                  ),
                                  Text(
                                    'Solicitar religação',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.only(top: 8.0),
                            color: Colors.black12,
                            width: 110,
                            height: 120,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.location_on_outlined,
                                          color: Colors.white, size: 48.0),
                                      Text(
                                        'Lojas de atendimento',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ]))),
                      ),
                    ]),
                  ],
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Comprovante de residência"),
                onTap: () {
                  reportView(context);
                },
                // onLongPress:
              ),
            ),
            Card(
                child: ListTile(
              leading: Icon(Icons.access_time_sharp),
              title: Text("Agendar atendimento"),
              onTap: () {
                onPressed:
                _launchURL();
              },
            )),
            Card(
                child: ListTile(
              leading: Icon(
                Icons.list_alt_rounded,
              ),
              title: Text("Minha unidade consumidora"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListaUnidadesConsumidoras();
                }));

              },
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.screen_share_outlined),
              title: Text("Informações sobre serviços"),
              onTap: () {
                print('card pressed');
              },
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.mobile_friendly_outlined),
              title: Text("Histórico de protocolos de emergência"),
              onTap: () {
                print('card pressed');
              },
            )), //PDFCreator
            Card(
                child: ListTile(
              leading: Icon(Icons.battery_charging_full_rounded),
              title: Text("Tempo real no estado"),
              onTap: () {
                print('card pressed');
              },
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.call),
              title: Text("Telefones"),
              onTap: () {
                print('card pressed');
              },
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Sobre"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return sobre();
                }));
              },
            )),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
navigate(context){
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Cadastro()));

}

PopupMenuButton showMenu(context) {
  if (unidadeConsummidora == 0) {
    return PopupMenuButton<WhyFarther>(
        icon: Icon(
          Icons.more_horiz,
          size: 42,
          color: Colors.white,
        ),
        onSelected: (WhyFarther result) {
          navigate(context);
          // setState(() {
          //   var _selection = result;
          // });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child: Text('Cadastrar unidade consumidora'),
              ),
            ]);
  } else {
    return PopupMenuButton<WhyFarther>(
        icon: Icon(
          Icons.more_horiz,
          size: 42,
          color: Colors.white,
        ),
        onSelected: (WhyFarther result) {
          // setState(() {
          //   var _selection = result;
          // });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child: Text('Editar'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.smarter,
                child: Text('Excluir'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.selfStarter,
                child: Text('Trocar unidade consumidora'),
              ),
            ]);
  }
}

showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {},
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Promoção Imperdivel"),
    content: Text("Não perca a promoção."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

_launchURL() async {
  const url = 'https://celproxximoweb.celesc.com.br?mod=infotv.agendamento';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class PDFCreator extends StatefulWidget {
  PDFCreator(param0);

  @override
  _PDFCreatorState createState() => _PDFCreatorState();
}

class _PDFCreatorState extends State<PDFCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              margin: EdgeInsets.only(top: 30),
              height: 40,
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Get Report',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    reportView(context);
                  }))),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class ItemLista extends StatelessWidget {
  IconData icone;
  String t;

  ItemLista(t, icone);

  @override
  Widget build(BuildContext context) {
    print(t);
    return Card(
        child: ListTile(leading: Icon(icone), title: Text(t.toString())));
  }
}
