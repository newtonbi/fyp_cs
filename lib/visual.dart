import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class Visualization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Pupil to Teacher Ratio Analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('Arusha', 46),
                SalesData('Dar', 48),
                SalesData('Dodoma', 66),
                SalesData('Geita', 73),
                SalesData('Kagera', 46),
                SalesData('Kigoma', 66),
                SalesData('Moshi', 37),
                SalesData('Lindi', 46)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]))));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
