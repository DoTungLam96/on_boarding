/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_on_boarding/common/widget_common.dart';

/// Example of a stacked bar chart with three series, each rendered with
/// different fill colors.
class StackedFillColorBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  StackedFillColorBarChart(this.seriesList, {this.animate});

  factory StackedFillColorBarChart.withSampleData() {
    return StackedFillColorBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      // Configure a stroke width to enable borders on the bars.
      barRendererDecorator: charts.BarLabelDecorator(
          insideLabelStyleSpec: charts.TextStyleSpec(
              fontSize: 15,
              color: charts.ColorUtil.fromDartColor(
                  WidgetCommon.orange_chart_color))),
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (charts.SelectionModel model) {
            final selectedIndex = model.selectedDatum[0].index;
            final value =
                model.selectedSeries[0].data[selectedIndex ?? 0].sales;
            WidgetCommon.I.showSnackBar(content: value.toString());
          },
        )
      ],

      defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.stacked, strokeWidthPx: 1.0),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('B.CNTT', 5),
      OrdinalSales('B.TT', 25),
      OrdinalSales('CQCT', 100),
      OrdinalSales('VTT', 25),
      OrdinalSales('VTS', 20),
      OrdinalSales('VTN', 45),
      OrdinalSales('VCM', 65),
      OrdinalSales('VTIT', 35),
    ];

    final tableSalesData = [
      OrdinalSales('B.CNTT', 25),
      OrdinalSales('B.TT', 35),
      OrdinalSales('CQCT', 80),
      OrdinalSales('VTT', 40),
      OrdinalSales('VTS', 20),
      OrdinalSales('VTN', 45),
      OrdinalSales('VCM', 65),
      OrdinalSales('VTIT', 25),
    ];

    final mobileSalesData = [
      OrdinalSales('B.CNTT', 20),
      OrdinalSales('B.TT', 40),
      OrdinalSales('CQCT', 10),
      OrdinalSales('VTT', 60),
      OrdinalSales('VTS', 25),
      OrdinalSales('VTN', 20),
      OrdinalSales('VCM', 15),
      OrdinalSales('VTIT', 15),
    ];

    final mobileSalesData2 = [
      OrdinalSales('B.CNTT', 10),
      OrdinalSales('B.TT', 20),
      OrdinalSales('CQCT', 30),
      OrdinalSales('VTT', 40),
      OrdinalSales('VTS', 35),
      OrdinalSales('VTN', 30),
      OrdinalSales('VCM', 25),
      OrdinalSales('VTIT', 10),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData2,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.white),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(WidgetCommon.rose_chart_color),
      ),

      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.white),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(WidgetCommon.orange_chart_color),
      ),

      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.white),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(WidgetCommon.blue_chart_color),
        domainFn: (OrdinalSales sales, _) => sales.year,
      ),
      // Hollow green bars.
      charts.Series<OrdinalSales, String>(
        id: 'Mobile2',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.white),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(WidgetCommon.green_chart_color),
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
