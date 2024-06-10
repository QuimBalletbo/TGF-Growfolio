import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion charts package
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/textInformation.dart';

// Define ChartData class for radial bar chart data
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

// ignore_for_file: must_be_immutable
class ShowReturnGraphicDialog extends StatefulWidget {
  ShowReturnGraphicDialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturnGraphicDialogState createState() =>
      _ShowReturnGraphicDialogState();
}

class _ShowReturnGraphicDialogState extends State<ShowReturnGraphicDialog> {
  @override
  void initState() {
    super.initState();
    widget.controller.initViewData();
    score = double.parse(widget.controller.getScore().toString());
  }

  double score = 0.0;

  @override
  Widget build(BuildContext context) {
    // Data for the radial bar chart
    List<ChartData> chartData = [
      ChartData('Score', score, const Color(0xFF3D2FE7)),
    ];

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameTitleText(text: 'score'),
            const SizedBox(height: 6.0),
            Divider(color: appTheme.deepOrange200, indent: 4.0, endIndent: 4.0),
            SizedBox(height: 20.v),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300, // Set the desired width
                  height: 300, // Set the desired height
                  child: SfCircularChart(
                    legend: const Legend(isVisible: false),
                    series: <CircularSeries<ChartData, String>>[
                      RadialBarSeries<ChartData, String>(
                        dataSource: chartData,
                        maximumValue: 100,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        pointColorMapper: (ChartData data, _) => data.color,
                        radius: '100%', // Full size of the container
                        innerRadius: '80%', // Make the radial bar thinner
                        // End angle for the bars
                        cornerStyle: CornerStyle.bothCurve, // Rounded edges
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        "Score ${score.toInt()}",
                        style: theme.textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
