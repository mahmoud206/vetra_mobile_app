class Constants {
  // API Base URL
  static const String baseUrl = 'https://vetratech-mobile-api.onrender.com';

  // Database Options
  static const List<String> databaseOptions = [
    'Elanam-KhamisMushit',
    'Elanam-Baish',
    'Elanam-Zapia'
  ];

  // Excluded Contacts for Sales and Profit Report
  static const List<String> excludedContacts = [
    'د/ محمد صيدلية بيش',
    'عيادة الأنعام - الإدارة',
    'مؤسسة علي محمد غروي البيطرية',
    'صيدليه علي محمد غروي',
    'عيادة الانعام الظبية'
  ];

  // Payment Methods
  static const Map<String, String> paymentMethods = {
    'كاش': 'cash',
    'شبكة': 'network',
  };

  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
}