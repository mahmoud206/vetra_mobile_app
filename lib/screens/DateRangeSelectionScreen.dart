import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../utils/localization/app_localizations.dart';

class DateRangeSelectionScreen extends StatefulWidget {
  @override
  _DateRangeSelectionScreenState createState() => _DateRangeSelectionScreenState();
}

class _DateRangeSelectionScreenState extends State<DateRangeSelectionScreen> {
  DateTime? startDate;
  DateTime? endDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        startDate = args.value.startDate;
        endDate = args.value.endDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localizations.selectDateRange)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            SizedBox(height: 20),
            if (startDate != null && endDate != null)
              Text('من: ${startDate!.toLocal()} إلى: ${endDate!.toLocal()}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/report-generation');
              },
              child: Text(localizations.generateReport),
            ),
          ],
        ),
      ),
    );
  }
}