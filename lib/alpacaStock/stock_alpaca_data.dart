import 'dart:convert';
import 'package:http/http.dart';
class StockAlpacaData {

  String ticker;


  StockAlpacaData({this.ticker});

  // returnBidData();
  Future<Map> returnStockAlpacaData() async {
    Response response = await get(
        'https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/polygon/get-ticker-details?ticker='+ticker);
    Map data = await jsonDecode(response.body);
    // print(data);
    return data;
  }
}