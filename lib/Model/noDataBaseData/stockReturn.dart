import 'package:realm/realm.dart';

class StockReturn {
  final ObjectId assetID;
  final double finalValue;

  StockReturn({required this.assetID, required this.finalValue});
}
