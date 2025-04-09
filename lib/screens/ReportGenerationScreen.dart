import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vetratech_mobile_app/services/PdfGenerator.dart';

import '../widgets/ReportPreviewWidget.dart';

class ReportGenerationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('توليد التقارير')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Fetch data from API and generate PDF
            final data = [
              {'service': 'خدمة 1', 'quantity': 5, 'price': 100},
              {'service': 'خدمة 2', 'quantity': 3, 'price': 200},
            ];

            final filePath = await PdfGenerator.generateReport(data);

            // Navigate to PDF preview
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportPreviewWidget(filePath: filePath),
              ),
            );
          },
          child: Text('توليد التقرير'),
        ),
      ),
    );
  }
}