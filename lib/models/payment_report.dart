class PaymentReport {
  final List<PaymentItem> items;

  PaymentReport({required this.items});

  factory PaymentReport.fromJson(List<dynamic> json) {
    return PaymentReport(
      items: json.map((item) => PaymentItem.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'items': items.map((item) => item.toJson()).toList(),
  };
}

class PaymentItem {
  final String method;
  final bool isOutgoing;
  final double totalAmount;
  final int transactionCount;

  PaymentItem({
    required this.method,
    required this.isOutgoing,
    required this.totalAmount,
    required this.transactionCount,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      method: json['method'],
      isOutgoing: json['isOutgoing'],
      totalAmount: (json['totalAmount'] as num).toDouble(),
      transactionCount: json['transactionCount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'method': method,
    'isOutgoing': isOutgoing,
    'totalAmount': totalAmount,
    'transactionCount': transactionCount,
  };
}