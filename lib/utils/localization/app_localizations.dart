import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'home_title': 'Welcome to VetRatech Mobile App',
      'select_database': 'Select Database',
      'select_date_range': 'Select Date Range',
      'generate_report': 'Generate Report',
      'cash': 'Cash',
      'network': 'Network',
    },
    'ar': {
      'home_title': 'مرحبًا بكم في تطبيق أنظمة البيطرة',
      'select_database': 'اختر قاعدة البيانات',
      'select_date_range': 'اختيار نطاق التاريخ',
      'generate_report': 'توليد التقرير',
      'cash': 'كاش',
      'network': 'شبكة',
    },
  };

  String get homeTitle => _localizedValues[locale.languageCode]!['home_title']!;
  String get selectDatabase => _localizedValues[locale.languageCode]!['select_database']!;
  String get selectDateRange => _localizedValues[locale.languageCode]!['select_date_range']!;
  String get generateReport => _localizedValues[locale.languageCode]!['generate_report']!;
  String get cash => _localizedValues[locale.languageCode]!['cash']!;
  String get network => _localizedValues[locale.languageCode]!['network']!;

  // Add the 'ar' method to handle Arabic text
  String ar(String text) {
    // In Flutter, Arabic text rendering is handled by the font.
    // No additional bidi processing is needed here.
    return text;
  }
}