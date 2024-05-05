import 'package:flutter/material.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MissionChart extends StatefulWidget {
  const MissionChart({super.key});

  @override
  State<MissionChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<MissionChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('B.CNTT', 12, 10, 14, 20),
      ChartData('B.TT', 14, 11, 18, 23),
      ChartData('CQCT', 16, 10, 15, 20),
      ChartData('VTT', 18, 16, 18, 24),
      ChartData('VTS', 12, 10, 14, 20),
      ChartData('VTN', 14, 11, 18, 23),
      ChartData('VCM', 16, 10, 15, 20),
      ChartData('VTIT', 22, 16, 12, 6)
    ];

    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryYAxis: NumericAxis(
          tickPosition: TickPosition.inside,
          axisLine: const AxisLine(color: Colors.white),
          majorTickLines:
              const MajorTickLines(color: Colors.white, width: 1, size: 10),
          axisLabelFormatter: (AxisLabelRenderDetails args) {
            return ChartAxisLabel(args.text,
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12));
          },
        ),
        primaryXAxis: CategoryAxis(
          tickPosition: TickPosition.inside,
          majorGridLines: const MajorGridLines(width: 2, color: Colors.white),
          axisBorderType: AxisBorderType.withoutTopAndBottom,
          majorTickLines: const MajorTickLines(color: Colors.white),
          axisLabelFormatter: (AxisLabelRenderDetails args) {
            return ChartAxisLabel(
                args.text,
                Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 9, fontWeight: FontWeight.w600));
          },
        ),
        tooltipBehavior: TooltipBehavior(
            enable: true,
            borderColor: Colors.grey,
            borderWidth: 1,
            builder: (data, point, series, pointIndex, seriesIndex) {
              final chartData = data as ChartData;
              String dataSelected = "";
              switch (seriesIndex) {
                case 0:
                  dataSelected = chartData.y1.toString();
                case 1:
                  dataSelected = chartData.y2.toString();
                case 2:
                  dataSelected = chartData.y3.toString();
                case 3:
                  dataSelected = chartData.y4.toString();
                  break;
                default:
              }

              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  dataSelected,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              );
            },
            color: Colors.white),
        series: <CartesianSeries>[
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              width: 0.5,
              xValueMapper: (ChartData data, _) => data.x,
              color: WidgetCommon.green_chart_color,
              yValueMapper: (ChartData data, _) => data.y1),
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              width: 0.5,
              color: WidgetCommon.blue_chart_color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2),
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              color: WidgetCommon.orange_chart_color,
              width: 0.5,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y3),
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              color: WidgetCommon.rose_chart_color,
              width: 0.5,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y4)
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}
