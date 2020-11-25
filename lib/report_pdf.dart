import 'dart:io';
import 'package:celesc_app/pdf_viwer_page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;

import 'database/app_database.dart';
import 'models/UnidadeConsumidora.dart';



reportView(context) async{
 String  xl= '';
  final List<UnidadeConsumidora> uconsumidoras = await findAll();
for(UnidadeConsumidora x in uconsumidoras){
  xl+=(x.toString());}
  final Document pdf = Document();



  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Report', textScaleFactor: 2),
                  PdfLogo()
                ])),
        Header(level: 1, text: 'What is Lorem Ipsum?'),
        Paragraph(
            text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        Paragraph(
            text:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for "lorem ipsum" will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
        Header(level: 1, text: 'Where does it come from?'),
        Paragraph(
            text: xl),

        Padding(padding: const EdgeInsets.all(10)),
        Table.fromTextArray(context: context, data: const <List<String>>[

          <String>['Year', 'Ipsum', 'Consumo'],
          <String>['2000', 'Ipsum 1.0', ' RS 12.2'],
          <String>['2001', 'Ipsum 1.1', ' RS 12.2'],
          <String>['2002', 'Ipsum 1.2', ' RS 12.5'],
          <String>['2003', 'Ipsum 1.3', ' RS 13.2'],
          <String>['2004', 'Ipsum 1.4', ' RS 12.2'],
          <String>['2004', 'Ipsum 1.5', ' RS 12.2'],
          <String>['2006', 'Ipsum 1.6', ' RS 12.2'],
          <String>['2007', 'Ipsum 1.7', ' RS 12.2'],
          <String>['2008', 'Ipsum 1.7', ' RS 12.2'],
        ]),
      ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}