import 'package:flutter/material.dart';
import '../utils/localization/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localizations.homeTitle)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/database-selection');
          },
          child: Text(localizations.selectDatabase),
        ),
      ),
    );
  }
}