import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';
import '../utils/localization/app_localizations.dart';

class ReportPreviewWidget extends StatelessWidget {
  final String filePath;

  ReportPreviewWidget({required this.filePath});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localizations.generateReport)),
      body: SfPdfViewer.file(File(filePath)),
    );
  }
}