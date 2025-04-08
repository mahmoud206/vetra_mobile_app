import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import CartesianSeries
import '../models/sales_report.dart';
import '../models/clinic_report.dart';
import '../models/payment_report.dart';
import '../services/api_service.dart';

class SalesReportScreen extends StatefulWidget {
  final String dbOption; // Database option (e.g., 'خميس مشيط', 'بيش', etc.)
  final DateTimeRange dateRange; // Selected date range

  const SalesReportScreen({
    super.key,
    required this.dbOption,
    required this.dateRange,
  });

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  late Future<Map<String, dynamic>> _reportData;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _reportData = _apiService.fetchFullReport(
      dbName: widget.dbOption, // Use the selected database option
      startDate: widget.dateRange.start, // Use the start date of the selected range
      endDate: widget.dateRange.end, // Use the end date of the selected range
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التقارير الشاملة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {
              _reportData = _apiService.fetchFullReport(
                dbName: 'khamis',
                startDate: DateTime.now().subtract(const Duration(days: 30)),
                endDate: DateTime.now(),
              );
            }),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _reportData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }
          final data = snapshot.data!;
          final paymentReport = PaymentReport.fromJson(data['payment_report']);
          final clinicReport = ClinicReport.fromJson(data['clinic_report']);
          final salesReport = SalesReport.fromJson(data['sales_report']);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Payment Report Section
                _buildSectionTitle('تقرير المدفوعات'),
                _buildPaymentChart(paymentReport),
                const SizedBox(height: 20),
                // Clinic Report Section
                _buildSectionTitle('تقرير العيادة'),
                _buildClinicStats(clinicReport),
                const SizedBox(height: 20),
                // Sales Report Section
                _buildSectionTitle('تقرير المبيعات'),
                _buildSalesChart(salesReport),
                const SizedBox(height: 20),
                _buildTopProducts(salesReport),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildPaymentChart(PaymentReport report) {
    return SizedBox(
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries<dynamic, dynamic>>[
          BarSeries<PaymentItem, String>(
            dataSource: report.items,
            xValueMapper: (item, _) => item.method,
            yValueMapper: (item, _) => item.totalAmount,
            name: 'المبلغ',
            color: Colors.green,
          )
        ],
      ),
    );
  }

  Widget _buildClinicStats(ClinicReport report) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildStatRow('الإيراد الكلي', report.totalRevenue),
            _buildStatRow('إيراد خدمات لارج', report.largeServicesRevenue),
            _buildStatRow('إيراد خدمات عادية', report.normalServicesRevenue),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$value SAR',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSalesChart(SalesReport report) {
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries<dynamic, dynamic>>[
          ColumnSeries<SalesData, String>(
            dataSource: [
              SalesData('الإيرادات', report.totalRevenue),
              SalesData('الأرباح', report.totalProfit),
            ],
            xValueMapper: (data, _) => data.category,
            yValueMapper: (data, _) => data.value,
            name: 'القيمة',
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  Widget _buildTopProducts(SalesReport report) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'أفضل المنتجات',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Table(
          border: TableBorder.all(),
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('المنتج', textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('الإيراد', textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('الربح', textAlign: TextAlign.center),
                ),
              ],
            ),
            ...report.topProducts.map((product) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(product.productName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('${product.revenue.toStringAsFixed(2)} SAR'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('${product.profit.toStringAsFixed(2)} SAR'),
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }
}

class SalesData {
  final String category;
  final double value;

  SalesData(this.category, this.value);
}