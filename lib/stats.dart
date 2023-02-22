import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepData {
  final DateTime date;
  final double hours;

  SleepData(this.date, this.hours);
}

class StatsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  List<SleepData> sleepData = [];

  Future<List<SleepData>> retrieveSleepData() async {
    final prefs = await SharedPreferences.getInstance();

    final encodedData = prefs.getString('sleep_data');
    if (encodedData == null) {
      return [];
    }

    final dataList = encodedData.split(';').map((encoded) {
      final parts = encoded.split(':');
      final date = DateTime.parse(parts[0]);
      final hours = double.parse(parts[1]);
      return SleepData(date, hours);
    }).toList();

    return dataList;
  }

  @override
  void initState() {
    super.initState();
    retrieveSleepData().then((dataList) {
      setState(() {
        sleepData = dataList;
        //for testing
        sleepData = [
        SleepData(DateTime(2023, 2, 15), 7.5),
        SleepData(DateTime(2023, 2, 16), 8.0),
        SleepData(DateTime(2023, 2, 17), 7.0),
        SleepData(DateTime(2023, 2, 18), 6.5),
        SleepData(DateTime(2023, 2, 19), 7.5),
        SleepData(DateTime(2023, 2, 20), 9.0),
        SleepData(DateTime(2023, 2, 21), 8.0)];
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Hours of Sleep per Day',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Expanded(
                    child: charts.TimeSeriesChart(
                      _createSampleData(),
                      animate: true,
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




List<charts.Series<SleepData, DateTime>> _createSampleData() {
    return [
      charts.Series<SleepData, DateTime>(
        id: 'Sleep',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (data, _) => data.date,
        measureFn: (data, _) => data.hours,
        data: sleepData,
      )
    ];
  }
}


