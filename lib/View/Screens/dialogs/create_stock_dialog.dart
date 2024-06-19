import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_%.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_stock_dialog_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/searchBar.dart';
import 'package:flutter_application_1/View/widgets/custom_TicketListCard.dart';
import 'package:flutter_application_1/Model/noDataBaseData/TicketSearch.dart';
import 'package:flutter_application_1/View/widgets/stock_name_card.dart';

class CreateStockDialog extends StatefulWidget {
  CreateStockDialog({Key? key}) : super(key: key);
  CreateStockController viewController = CreateStockController();

  @override
  _CreateStockDialogState createState() => _CreateStockDialogState();
}

class _CreateStockDialogState extends State<CreateStockDialog> {
  @override
  void initState() {
    super.initState();

    equalWeightStocks = widget.viewController.getEqualWeightStocks();
  }

  StockController controller = StockController();
  String stockName = '';
  bool includeFWT = false;
  int stockAllocation = 0;
  List<TicketSearch> ticketSearchList = [];
  bool stockChoosen = false;
  TicketSearch stockSearch = TicketSearch(name: '', symbol: '');
  StockInfo stockInfo = StockInfo(avgDividend: 0, avgReturn: 0);

  bool errorStockAllocation = false;
  bool errorStockInfo = false;
  bool errorFieldEmpty = false;
  bool equalWeightStocks = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
      decoration: AppDecoration.outlinePrimary8.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Keep in mind that stocks from the S&P 500 will always be present, but availability of stocks from other countries may fluctuate.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Choose a Stock",
              style: theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),
          const SizedBox(height: 6.0),
          Visibility(
            visible: stockChoosen && !errorStockInfo,
            child: CustomSymbolContainer(
                symbol: stockSearch.name,
                updateUI: (() {
                  setState(() {
                    stockChoosen = false;
                  });
                })),
          ),
          Visibility(
            visible: !stockChoosen || errorStockInfo,
            child: CustomSearchBar(
              controller: controller.searchController,
              onEditionCompleate: (value) async {
                // Perform the asynchronous operation
                ticketSearchList =
                    await widget.viewController.fetchDataTicketSearch(value);

                // Update the state with the search results
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: !stockChoosen || errorStockInfo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: ticketSearchList.isEmpty
                  ? []
                  : [
                      // Render portfolios if available ETFPortfolio
                      ...ticketSearchList.map(
                        (ticketSearchList) => Column(
                          children: [
                            CustomTicketSearchList(
                              ticketSearch: ticketSearchList,
                              onPressed: (ticketSearch) async {
                                stockSearch = ticketSearch;
                                stockChoosen = true;
                                stockInfo = await widget.viewController
                                    .fetchStockInfo(stockSearch.symbol);
                                errorStockInfo = widget.viewController
                                    .validateStock(stockInfo);

                                print(
                                    "dy: ${stockInfo.avgDividend}, avgR: ${stockInfo.avgReturn}");

                                setState(() {});
                                // Do something with the symbol value
                              },
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 4.0,
                              endIndent: 4.0,
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ),
          const SizedBox(height: 6.0),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockInfo,
              child: Text(
                "Sorry, the security you've chosen is not valid.",
                style: errorStockInfo
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          ToggleButton(
            text: "Include Foreign Withholding Tax",
            onToggleChanged: (value) {
              setState(() {
                includeFWT = widget.viewController.getIncludeFWT(
                    value); // Update the portfolio name in the state
              });
            },
          ),
          const SizedBox(height: 6.0),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected that the stocks will not be equally weighted.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Visibility(
            visible: equalWeightStocks,
            child: EnterTextPercentage(
              text: "Stock Allocation (%)  of total Stocks",
              defaultText: "%",
              controller: controller.enterTextController,
              onTextChanged: (value) {
                setState(() {
                  errorStockAllocation =
                      widget.viewController.checkIntegerValidity(value);
                  stockAllocation = widget.viewController
                      .getStockAllocation(value, errorStockAllocation);
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Visibility(
              visible: errorStockAllocation,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorStockAllocation
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Visibility(
              visible: errorFieldEmpty,
              child: Text(
                "Invalid format. one or more fields are empty. Please fill in all fields and try again",
                style: errorFieldEmpty
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          CustomSpaceButton(
            text: "Save Stock",
            onTap: () {
              onTapContinue(context);
            },
          ),
        ],
      ),
    ));
  }

  onTapContinue(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.validateStockName(stockSearch);
      if (errorFieldEmpty == false &&
          errorStockAllocation == false &&
          stockChoosen == true) {
        errorFieldEmpty = widget.viewController.createStock(
            stockSearch.name,
            includeFWT,
            stockAllocation,
            stockInfo.avgReturn,
            stockInfo.avgDividend);

        Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
      }
    });
  }
}
