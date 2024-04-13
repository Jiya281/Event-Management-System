import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf_lib;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateScreen extends StatelessWidget {
  CertificateScreen({Key? key, required Null Function() onCertificateGenerated})
      : super(key: key);

  final String userName = "John Doe";
  final String organizerName = "Event City"; // Event organizer's name

  Future<void> generateCertificate(BuildContext context) async {
    final ByteData fontDataRegular =
        await rootBundle.load("fonts/OpenSans-Regular.ttf");
    final ByteData fontDataBold =
        await rootBundle.load("fonts/OpenSans-Bold.ttf");

    final pdf = pdf_lib.Document();

    pdf.addPage(
      pdf_lib.MultiPage(
        build: (context) => [
          // Wrap the certificate content with a container with border
          pdf_lib.Container(
            margin: pdf_lib.EdgeInsets.all(10.0),
            decoration: pdf_lib.BoxDecoration(
              border: pdf_lib.Border.all(
                color: PdfColors.black,
                width: 2.0,
              ),
            ),
            child: pdf_lib.Container(
              margin: pdf_lib.EdgeInsets.symmetric(vertical: 40.0),
              child: pdf_lib.Column(
                crossAxisAlignment: pdf_lib.CrossAxisAlignment.center,
                children: [
                  pdf_lib.Text(
                    'Certificate of Completion',
                    style: pdf_lib.TextStyle(
                      fontSize: 24.0,
                      fontWeight: pdf_lib.FontWeight.bold,
                      font: pdf_lib.Font.ttf(fontDataBold),
                      color: PdfColors.blue,
                    ),
                  ),
                  pdf_lib.SizedBox(height: 20),
                  pdf_lib.Text(
                    'This is to certify that',
                    style: pdf_lib.TextStyle(
                      fontSize: 18.0,
                      font: pdf_lib.Font.ttf(fontDataRegular),
                      color: PdfColors.black,
                    ),
                  ),
                  pdf_lib.Text(
                    userName,
                    style: pdf_lib.TextStyle(
                      fontSize: 22.0,
                      fontWeight: pdf_lib.FontWeight.bold,
                      font: pdf_lib.Font.ttf(fontDataBold),
                      color: PdfColors.red, // Changed user name color
                    ),
                  ),
                  pdf_lib.SizedBox(height: 10),
                  pdf_lib.Text(
                    'has successfully completed the event',
                    style: pdf_lib.TextStyle(
                      fontSize: 18.0,
                      font: pdf_lib.Font.ttf(fontDataRegular),
                      color: PdfColors.black,
                    ),
                  ),
                  pdf_lib.SizedBox(height: 20),
                  pdf_lib.Row(
                    mainAxisAlignment: pdf_lib.MainAxisAlignment.center,
                    children: [
                      pdf_lib.Text(
                        'Completed the event on ',
                        style: pdf_lib.TextStyle(
                          fontSize: 18.0,
                          font: pdf_lib.Font.ttf(fontDataRegular),
                          color: PdfColors.black,
                        ),
                      ),
                      pdf_lib.Text(
                        '${DateTime.now().toString().substring(0, 10)}',
                        style: pdf_lib.TextStyle(
                          fontSize: 18.0,
                          font: pdf_lib.Font.ttf(fontDataRegular),
                          color: PdfColors.red, // Changed date color
                        ),
                      ),
                    ],
                  ),
                  pdf_lib.SizedBox(height: 20),
                  pdf_lib.Text(
                    'Held by $organizerName', // Event organizer's name
                    style: pdf_lib.TextStyle(
                      fontSize: 18.0,
                      font: pdf_lib.Font.ttf(fontDataRegular),
                      color: PdfColors.black,
                    ),
                  ),
                  pdf_lib.SizedBox(height: 20),
                  pdf_lib.Text(
                    'Jiya Gangwani (JG)', // Your name with initials
                    style: pdf_lib.TextStyle(
                      fontSize: 18.0,
                      font: pdf_lib.Font.ttf(fontDataRegular),
                      color: PdfColors.black,
                    ),
                  ),
                  pdf_lib.SizedBox(height: 20),
                  pdf_lib.Row(
                    mainAxisAlignment: pdf_lib.MainAxisAlignment.center,
                    children: [
                      pdf_lib.Container(
                        width: 200,
                        height: 1.0,
                        color: PdfColors.grey,
                      ),
                    ],
                  ),
                  pdf_lib.SizedBox(height: 10),
                  pdf_lib.Text(
                    'Organizer Signature', // Organizer's signature
                    style: pdf_lib.TextStyle(
                      fontSize: 18.0,
                      font: pdf_lib.Font.ttf(fontDataRegular),
                      color: PdfColors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/certificate.pdf');

    await file.writeAsBytes(await pdf.save());

    // Open PDF in PDF viewer
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Certificate'),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       openPdfFile(file);
            //     },
            //     icon: Icon(Icons.download),
            //   ),
            // ],
          ),
          body: PDFView(
            filePath: file.path,
          ),
        ),
      ),
    );
  }

  Future<void> openPdfFile(File file) async {
    final filePath = file.path;
    if (Platform.isAndroid) {
      final url = 'file://$filePath';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isIOS) {
      final url = 'file://$filePath';
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificate Generator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            generateCertificate(context);
          },
          child: Text('Generate Certificate'),
        ),
      ),
    );
  }
}
