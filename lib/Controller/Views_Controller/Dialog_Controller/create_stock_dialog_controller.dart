import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/utils/JSONObject.dart';
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

  bool validateStockName(String stockName) {
    if ((stockName.isNotEmpty &&
        stockName.length <= 20 &&
        stockName.length >= 2)) {
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
              10,
              10,
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
              10,
              10,
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
    // final String apiUrl =  'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$keyword&apikey=$apiKey';
    final String apiUrl =
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo';

    try {
      // Make the HTTP GET request
      http.Response response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic>? data = json.decode(response.body);
        print("data recibed");
        // Check if 'bestMatches' is null or not
        print(data);
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
}

class StockController {
  TextEditingController stockNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
  TextEditingController searchController = TextEditingController();
}
