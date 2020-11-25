import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final Uint8List fontData = File('open-sans.ttf').readAsBytesSync();
final ttf = pw.Font.ttf(fontData.buffer.asByteData());

class PdfGeneration {


  void createImage(pdf, imageLocation){

  final image = PdfImage.file(
    pdf.document,
    bytes: File(imageLocation).readAsBytesSync(),
  );

    pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          ); // Center
        })); // Page
  }

  void addWarning(warning, pdf) {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
                warning, style: pw.TextStyle(font: ttf, fontSize: 40)),
          ); // Center
        })); // Page
  }

  void save(name) async {
    final pdf = pw.Document();

    final file = File(name + ".pdf");
    await file.writeAsBytes(pdf.save());
  }
}