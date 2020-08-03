import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/time_series_cases.dart';

class Chart extends StatelessWidget {

  final List<charts.Series<TimeSeriesCases, DateTime>> seriesList;
  final bool animate;

  Chart(this.seriesList, {this.animate});  

  @override
  Widget build(BuildContext context) {

    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      domainAxis: charts.EndPointsTimeAxisSpec(),
    );

  }
}