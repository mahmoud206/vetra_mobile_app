import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import Screens
import '../screens/HomeScreen.dart';
import '../screens/DatabaseSelectionScreen.dart';
import '../screens/DateRangeSelectionScreen.dart';
import '../screens/ReportGenerationScreen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
        name: 'home',
      ),
      GoRoute(
        path: '/database-selection',
        builder: (context, state) => DatabaseSelectionScreen(),
        name: 'database_selection',
      ),
      GoRoute(
        path: '/date-range-selection',
        builder: (context, state) => DateRangeSelectionScreen(),
        name: 'date_range_selection',
      ),
      GoRoute(
        path: '/report-generation',
        builder: (context, state) => ReportGenerationScreen(),
        name: 'report_generation',
      ),
    ],
  );

  // Helper method to generate routes
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/database-selection':
        return MaterialPageRoute(builder: (_) => DatabaseSelectionScreen());
      case '/date-range-selection':
        return MaterialPageRoute(builder: (_) => DateRangeSelectionScreen());
      case '/report-generation':
        return MaterialPageRoute(builder: (_) => ReportGenerationScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Route not found'))));
    }
  }
}