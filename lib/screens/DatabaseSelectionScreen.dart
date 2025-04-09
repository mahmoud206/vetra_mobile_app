import 'package:flutter/material.dart';
import '../utils/localization/app_localizations.dart';
import '../utils/Constants.dart';

class DatabaseSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localizations.selectDatabase)),
      body: ListView.builder(
        itemCount: Constants.databaseOptions.length,
        itemBuilder: (context, index) {
          final dbOption = Constants.databaseOptions[index];
          return ListTile(
            title: Text(dbOption),
            onTap: () {
              // Save selected database and navigate to date range selection
              Navigator.pushNamed(context, '/date-range-selection');
            },
          );
        },
      ),
    );
  }
}