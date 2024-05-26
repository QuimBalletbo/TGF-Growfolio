import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Model/noDataBaseData/TicketSearch.dart';

class CreateStockController {
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late CreatePortfolio stocksPortfolio = AuthService().getCreatePortfolio();
  var portfolio = AuthService().getCreatePortfolio();
  ObjectId objectiD = ObjectId();

  late CreateStock stock;
  bool checkIntegerValidity(String value) {
    try {
      int intValue = int.parse(value);
      if (intValue >= 1 && intValue <= 100) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  bool validateStock(StockInfo stockInfo) {
    if (stockInfo.avgDividend != 0 || stockInfo.avgReturn != 0) {
      return false;
    }
    return true;
  }

  bool validateStockName(TicketSearch stockSearch) {
    if (stockSearch.name != '' && stockSearch.symbol != '') {
      return false;
    }
    return true;
  }

  String getStockNameValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return '';
    } else {
      return value;
    }
  }

  int getStockAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      return int.parse(value);
    }
  }

  bool getIncludeFWT(bool value) {
    return value;
  }

  bool createStock(
    String stockName,
    bool includeFWT,
    int stockAllocation,
    double avgReturn,
    double avgDividendYield,
  ) {
    if (stockName.isEmpty ||
        (stockAllocation == 0 &&
            stocksPortfolio.equalWeightStocks == 'Include')) {
      return true;
    } else {
      if (stocksPortfolio.equalWeightStocks == 'Exclude') {
        int numberStocks = (stocksPortfolio.stocks.length) + 1;
        realm.write(() => realm.add(CreateStock(
              objectiD,
              avgDividendYield,
              avgReturn,
              includeFWT,
              stockName,
              (100 ~/ numberStocks),
              user.id,
            )));
        if (numberStocks > 1) {
          for (int i = 0; (1 + i) < numberStocks; i++) {
            realm.write(() {
              stocksPortfolio.stocks[(i)].stockAllocation =
                  (100 ~/ numberStocks);
            });
          }
        }
      }
      if (stocksPortfolio.equalWeightStocks == 'Include') {
        realm.write(() => realm.add(CreateStock(
              objectiD,
              avgDividendYield,
              avgReturn,
              includeFWT,
              stockName,
              stockAllocation,
              user.id,
            )));
      }

      addStockToPortfolio(stockName);
      return false;
    }
  }

  void addStockToPortfolio(String stockName) {
    stock = realm.query<CreateStock>('id == \$0', [objectiD]).first;

    realm.write(() => stocksPortfolio.stocks.add(stock));
  }

  Future<List<TicketSearch>> fetchDataTicketSearch(String keyword) async {
    const String apiKey = 'E0QVKDIL619SRX98';
    final String apiUrl =
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$keyword&apikey=$apiKey';
    //final String apiUrl = 'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo';

    try {
      // Make the HTTP GET request
      http.Response response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic>? data = json.decode(response.body);
        if (data != null && data.containsKey('bestMatches')) {
          List<dynamic>? bestMatches = data['bestMatches'];

          // Extract the name and symbol for each match
          List<TicketSearch> matches = [];
          if (bestMatches != null) {
            for (var match in bestMatches) {
              String symbol = match['1. symbol'];
              String name = match['2. name'];
              matches.add(TicketSearch(name: name, symbol: symbol));
            }
          }
          print("matches created");
          return matches.take(4).toList();
        } else {
          // Return an empty list if 'bestMatches' is null or not found
          return [];
        }
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      throw Exception('Failed to load data: $e');
    }
  }

  Future<StockInfo> fetchStockInfo(String symbol) async {
    const String apiKey = 'E0QVKDIL619SRX98';
    final String apiUrl =
        'https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=$symbol&apikey=$apiKey';
    // const String apiUrl = 'https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=IBM&apikey=demo';

    try {
      // Make the HTTP GET request
      http.Response response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print("data recibed");
        // Parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);
        if (data != null && data.containsKey('Monthly Adjusted Time Series')) {
          print("matches starting");
          // Extract relevant data
          Map<String, dynamic> timeSeries =
              data['Monthly Adjusted Time Series'];
          List<Map<String, dynamic>> monthlyData = [];

          timeSeries.forEach((key, value) {
            monthlyData.add(value);
          });

          // Calculate average dividend and return
          double totalDividend = 0.0;
          double totalReturn = 100.0;
          int dividendCount = 0;
          double close = 0.0;

          // Calculate dividend for the first 12 months
          for (int i = 0; i < 12; i++) {
            close = double.parse(monthlyData[0]['4. close']);
            double dividend =
                double.parse(monthlyData[i]['7. dividend amount']);
            totalDividend += dividend;
          }
// Calculate average return for the last 5 months
          for (int i = 0; i < 60; i++) {
            double lastClose = double.parse(monthlyData[i]['4. close']);
            i += 12;
            double thisClose = double.parse(monthlyData[i]['4. close']);
            totalReturn += ((thisClose - lastClose) / lastClose) * 100;
          }
          // Calculate average dividend and return
          double avgDividend = (totalDividend / close) * 100;
          double avgReturn = totalReturn / 5;

          print("matches created");

          return StockInfo(avgDividend: avgDividend, avgReturn: avgReturn);
        } else {
          // Return an empty list if 'bestMatches' is null or not found
          return StockInfo(avgDividend: 0, avgReturn: 0);
        }
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      throw Exception('Failed to load data: $e');
    }
  }
}

class StockController {
  TextEditingController stockNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
  TextEditingController searchController = TextEditingController();
}
