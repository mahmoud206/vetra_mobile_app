class SalesReport {
  final double totalRevenue;
  final double totalProfit;
  final List<Product> topProducts;

  SalesReport({
    required this.totalRevenue,
    required this.totalProfit,
    required this.topProducts,
  });

  factory SalesReport.fromJson(Map<String, dynamic> json) {
    return SalesReport(
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalProfit: (json['totalProfit'] as num).toDouble(),
      topProducts: (json['topProducts'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}

class Product {
  final String productName;
  final double revenue;
  final double profit;

  Product({
    required this.productName,
    required this.revenue,
    required this.profit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'],
      revenue: (json['revenue'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
    );
  }
}