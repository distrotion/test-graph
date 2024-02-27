import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'POP-searchHistoryChartData.dart';

class LineChartSample22 extends StatefulWidget {
  LineChartSample22({
    super.key,
    required this.historyChartData,
  });
  List<HistoryChartModel> historyChartData;
  @override
  State<LineChartSample22> createState() => _LineChartSample22State();
}

class _LineChartSample22State extends State<LineChartSample22> {
  List<Color> gradientColors = [
    Color.fromARGB(255, 220, 146, 255),
    Color.fromRGBO(229, 80, 255, 1),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          // aspectRatio: 1.80,
          aspectRatio: 1.80,
          child: Padding(
            padding: const EdgeInsets.only(
                // right: 18,
                // left: 12,
                // top: 24,
                // bottom: 12,
                ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              '',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('', style: style);
        break;
      case 1:
        text = const Text('01:00', style: style);
        break;
      case 2:
        text = const Text('', style: style);
        break;
      case 3:
        text = const Text('', style: style);
        break;
      case 4:
        text = const Text('', style: style);
        break;
      case 5:
        text = const Text('', style: style);
        break;
      case 6:
        text = const Text('', style: style);
        break;
      case 7:
        text = const Text('07:00', style: style);
        break;
      case 8:
        text = const Text('', style: style);
        break;
      case 9:
        text = const Text('', style: style);
        break;
      case 10:
        text = const Text('', style: style);
        break;
      case 11:
        text = const Text('', style: style);
        break;
      case 12:
        text = const Text('', style: style);
        break;
      case 13:
        text = const Text('13:00', style: style);
        break;
      case 14:
        text = const Text('', style: style);
        break;
      case 15:
        text = const Text('', style: style);
        break;
      case 16:
        text = const Text('', style: style);
        break;
      case 17:
        text = const Text('', style: style);
        break;
      case 18:
        text = const Text('', style: style);
        break;
      case 19:
        text = const Text('19:00', style: style);
        break;
      case 20:
        text = const Text('', style: style);
        break;
      case 21:
        text = const Text('', style: style);
        break;
      case 22:
        text = const Text('', style: style);
        break;
      case 23:
        text = const Text('23:00', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 48:
        text = '48'; // Customize this text for value 1
        break;
      case 55:
        text = '55'; // Customize this text for value 3
        break;
      case 65:
        text = '65'; // Customize this text for value 5
        break;
      case 70:
        text = '70'; // Customize this text for value 8
        break;
      case 75:
        text = '75'; // Customize this text for value 10
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            // getTitlesWidget: bottomTitleWidgets,
            getTitlesWidget: (value, titleMeta) {
              return Padding(
                // You can use any widget here
                padding: EdgeInsets.only(
                  top: 20,
                  left: 50,
                ),
                child: Text(
                  widget.historyChartData[value.toInt()].samplingDate,
/*                   style: TextStyle(color: Colors.red), */
                  style: TextStyle(fontSize: 14),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color.fromARGB(255, 74, 55, 77)),
      ),
      // minX: 0,
      // maxX: 24,
      // minY: 52,
      // maxY: 75,

      lineBarsData: [
        // LineChartBarData(
        //   spots: ((() {
        //     if (widget.historyChartData.length == 1 &&
        //         double.parse(
        //                 ConverstStr(widget.historyChartData[0].resultApprove)) >
        //             0) {
        //       //for (int i = 0; i < historyChartData.length; i++)
        //       print("addddddd");
        //       return [
        //         FlSpot(
        //             1,
        //             (double.parse(
        //                 ConverstStr(widget.historyChartData[0].resultApprove))))
        //       ];
        //     } else {
        //       List<FlSpot> buff = [];
        //       for (int i = 0; i < widget.historyChartData.length; i++) {
        //         buff.add(FlSpot(
        //             i.toDouble(),
        //             (double.parse(ConverstStr(
        //                 widget.historyChartData[i].resultApprove)))));
        //       }
        //       return buff;
        //     }
        //   }())),
        //   isCurved: true,
        //   gradient: LinearGradient(
        //     colors: gradientColors,
        //   ),
        //   barWidth: 2.5,
        //   isStrokeCapRound: true,
        //   dotData: const FlDotData(
        //     show: false,
        //   ),
        //   belowBarData: BarAreaData(
        //     show: false,
        //     gradient: LinearGradient(
        //       colors: gradientColors
        //           .map((color) => color.withOpacity(0.3))
        //           .toList(),
        //     ),
        //   ),
        // ),
        LineChartBarData(
          isCurved: true,
          /* colors: const [Color(0xff27b6fc)], */
          color: Colors.blue,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
          /* spots: [for (final node in HistoryChartData) FlSpot(node.timestamp.toDouble(), node.rawValue)
        ], */
          spots: ((() {
            if (widget.historyChartData.length == 1 &&
                double.parse(
                        ConverstStr(widget.historyChartData[0].resultApprove)) >
                    0) {
              //for (int i = 0; i < historyChartData.length; i++)
              print("addddddd");
              return [
                FlSpot(
                    1,
                    (double.parse(
                        ConverstStr(widget.historyChartData[0].resultApprove))))
              ];
            } else {
              List<FlSpot> buff = [];
              for (int i = 0; i < widget.historyChartData.length; i++) {
                buff.add(FlSpot(
                    i.toDouble(),
                    (double.parse(ConverstStr(
                        widget.historyChartData[i].resultApprove)))));
              }
              return buff;
            }
          }())),
        ),
        // Add another line here
        // LineChartBarData(
        //   spots: const [
        //     FlSpot(0, 75),
        //     FlSpot(24, 75),
        //   ],
        //   isCurved: false,
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.orange,
        //       Colors.orange
        //     ], // Customize colors as needed
        //   ),
        //   barWidth: 1,
        //   isStrokeCapRound: true,
        //   dotData: const FlDotData(
        //     show: false,
        //   ),
        // ),
        // LineChartBarData(
        //   spots: const [
        //     FlSpot(0, 55),
        //     FlSpot(24, 55),
        //   ],
        //   isCurved: false,
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.orange,
        //       Colors.orange
        //     ], // Customize colors as needed
        //   ),
        //   barWidth: 1,
        //   isStrokeCapRound: true,
        //   dotData: const FlDotData(
        //     show: false,
        //   ),
        // ),
        // LineChartBarData(
        //   spots: const [
        //     FlSpot(0, 65),
        //     FlSpot(24, 65),
        //   ],
        //   isCurved: false,
        //   gradient: LinearGradient(
        //     colors: [Colors.green, Colors.green], // Customize colors as needed
        //   ),
        //   barWidth: 1,
        //   isStrokeCapRound: true,
        //   dotData: const FlDotData(
        //     show: false,
        //   ),
        // ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            // getTitlesWidget: bottomTitleWidgets,
            getTitlesWidget: (value, titleMeta) {
              return Padding(
                // You can use any widget here
                padding: EdgeInsets.only(
                  top: 20,
                  left: 50,
                ),
                child: Transform.rotate(
                  angle: -45,
                  child: Text(
                    widget.historyChartData[value.toInt()].samplingDate,
/*                   style: TextStyle(color: Colors.red), */
                    style: TextStyle(fontSize: 14),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 12,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2, 3.44),
            FlSpot(4.0, 3.44),
            FlSpot(6, 3.44),
            FlSpot(8, 3.44),
            FlSpot(10, 3.44),
            FlSpot(12, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String ConverstStr(dynamic input) {
  if (isNumeric(input)) {
    return input;
  } else {
    return '0';
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
