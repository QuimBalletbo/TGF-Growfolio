import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion charts package
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/Model/noDataBaseData/chartData.dart';
import 'package:flutter_application_1/View/widgets/squaresWithWords.dart';

class ShowReturn2_1Dialog extends StatefulWidget {
  ShowReturn2_1Dialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturn2_1DialogState createState() => _ShowReturn2_1DialogState();
}

class _ShowReturn2_1DialogState extends State<ShowReturn2_1Dialog> {
  @override
  void initState() {
    super.initState();
    widget.controller.initViewData();
    widget.controller.splitTime();
    widget.controller.getAmountInvested();
    widget.controller.getAvgReturnStock();
    widget.controller.getAvgReturnETF();
    widget.controller.getAvgReturnBond();
    chartData = widget.controller.createChartData();
    hasStocks = widget.controller.getHasStocks();
    hasBonds = widget.controller.getHasBonds();
    hasETFs = widget.controller.getHasETFs();
  }

  bool hasStocks = false;
  bool hasBonds = false;
  bool hasETFs = false;
  List<ChartData> chartData = [];
  @override
  Widget build(BuildContext context) {
    // Get the chart data from the controller

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
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  borderRadius: !hasBonds && !hasETFs
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      : BorderRadius.zero,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y1,
                  pointColorMapper: (ChartData data, _) => data.color1,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  borderRadius: !hasBonds
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      : BorderRadius.zero,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y2,
                  pointColorMapper: (ChartData data, _) => data.color2,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y3,
                  pointColorMapper: (ChartData data, _) => data.color3,
                ),
              ],
            ),
            SquaresWithWords(),
          ],
        ),
      ),
    );
  }
}
