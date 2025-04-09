class ClinicReport {
  final double totalRevenue;
  final double largeServicesRevenue;
  final double normalServicesRevenue;

  ClinicReport({
    required this.totalRevenue,
    required this.largeServicesRevenue,
    required this.normalServicesRevenue,
  });

  factory ClinicReport.fromJson(Map<String, dynamic> json) {
    return ClinicReport(
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      largeServicesRevenue: (json['largeServicesRevenue'] as num).toDouble(),
      normalServicesRevenue: (json['normalServicesRevenue'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'totalRevenue': totalRevenue,
    'largeServicesRevenue': largeServicesRevenue,
    'normalServicesRevenue': normalServicesRevenue,
  };
}