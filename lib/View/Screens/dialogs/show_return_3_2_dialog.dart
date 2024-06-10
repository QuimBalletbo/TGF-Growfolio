import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion charts package
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/textInformation.dart';

// Define ChartData class for donut chart data
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

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
    // Set dummy values for stocks, etfs, and bonds
    stocks = double.parse(
        widget.controller.getFinalStockPercentageValue().toString());
    etfs =
        double.parse(widget.controller.getFinalETFPercentageValue().toString());
    bonds = double.parse(
        widget.controller.getFinalBondPercentageValue().toString());
  }

  double stocks = 0.0;
  double etfs = 0.0;
  double bonds = 0.0;

  Widget _buildSquaresWithWords() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSquareWithWord('Stocks', stocks, const Color(0xFF3D2FE7)),
        _buildSquareWithWord('ETFs', etfs, const Color(0xFF2BD9FE)),
        _buildSquareWithWord('Bonds', bonds, const Color(0xFF2BFE7F)),
      ],
    );
  }

  Widget _buildSquareWithWord(String word, double value, Color color) {
    String formattedValue = value.toStringAsFixed(2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 15.0,
          height: 15.0,
          margin: EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Text(
          "$word $formattedValue%",
          style: TextStyle(fontSize: 16), // Adjust the font size as needed
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Data for the donut chart
    List<ChartData> chartData = [
      ChartData('Stocks', stocks, const Color(0xFF3D2FE7)),
      ChartData('ETFs', etfs, const Color(0xFF2BD9FE)),
      ChartData('Bonds', bonds, const Color(0xFF2BFE7F)),
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
            NameTitleText(text: 'final'),
            const SizedBox(height: 6.0),
            Divider(color: appTheme.deepOrange200, indent: 4.0, endIndent: 4.0),
            Stack(
              alignment: Alignment.center,
              children: [
                SfCircularChart(
                  legend: const Legend(isVisible: false),
                  series: <DoughnutSeries<ChartData, String>>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: chartData,
                      cornerStyle: CornerStyle.bothCurve, // Rounded edges
                      explode: true,
                      explodeIndex: 0,
                      explodeOffset: '0%',
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      innerRadius:
                          '80%', // Adjust inner radius for a donut shape
                      pointColorMapper: (ChartData data, _) => data.color,
                    ),
                  ],
                ),
                Center(
                  child: _buildSquaresWithWords(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
