import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfGenerator {
  static Future<String> generateReport(List<Map<String, dynamic>> data) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('تقرير المبيعات والإنفاق', style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('الخدمة', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('الكمية', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('السعر', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                  ...data.map((item) {
                    return pw.TableRow(
                      children: [
                        pw.Text(item['service']),
                        pw.Text(item['quantity'].toString()),
                        pw.Text(item['price'].toString()),
                      ],
                    );
                  }),
                ],
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/report.pdf');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }
}