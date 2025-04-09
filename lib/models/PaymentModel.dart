import 'package:flutter/material.dart';
import '../utils/localization/app_localizations.dart';

class PaymentModel {
  final String method;
  final bool isOutgoing;
  final double totalAmount;
  final int transactionCount;

  PaymentModel({
    required this.method,
    required this.isOutgoing,
    required this.totalAmount,
    required this.transactionCount,
  });

  String getLocalizedMethod(AppLocalizations localizations) {
    switch (method) {
      case 'cash':
        return localizations.cash;
      case 'network':
        return localizations.network;
      default:
        return method;
    }
  }

  String getLocalizedIsOutgoing(AppLocalizations localizations) {
    return isOutgoing ? localizations.ar('صادر') : localizations.ar('وارد');
  }
}