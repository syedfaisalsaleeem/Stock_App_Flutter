import 'dart:convert';
import 'package:http/http.dart';
class BidData {

  String ticker;
  String userid;
  BidData({this.ticker,this.userid});
  // returnBidData();
   Future<Map> returnBidData() async {
    Response response=await get('https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/stocks/bid/'+ticker+"?userid="+userid);
    Map data=await jsonDecode(response.body);
    // print(data);
    return data;
  }
  Future<Map> returnStockAlpacaData() async {
    Response response = await get(
        'https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/polygon/get-ticker-details?ticker='+ticker);
    Map data = await jsonDecode(response.body);
    // print(data);
    return data;
  }
  Future<Map> returnStockAlpacaPositions() async {
    Response response = await get('https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/stocks/positions/'+ticker+'?userid='+userid);
    Map data = await jsonDecode(response.body);
    // print(data);
    return data;
  }
  Future<Map> returnStockAlpacaAssets() async {
    Response response = await get('https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/stocks/get-alpaca-asset-details/'+ticker);
    Map data = await jsonDecode(response.body);
    // print(data);
    return data;
  }
  Future<Map> returnStockAlpacaAccountDetails() async {
    Response response = await get("https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/stocks/accountdetails?userid="+userid);
    Map data = await jsonDecode(response.body);
    // print(data);
    return data;
  }



}
// BidData instance = BidData(ticker:"AAPL");
// instance.returnBidData()
