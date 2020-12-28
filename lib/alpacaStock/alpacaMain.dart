import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:slak/alpacaStock/Bid_data.dart';
import 'package:slak/alpacaStock/rolling_switch.dart';
import 'package:slak/alpacaStock/stock_alpaca_data.dart';



class AlpacaMain extends StatefulWidget {
  @override
  _AlpacaMainState createState() => _AlpacaMainState();
}

class _AlpacaMainState extends State<AlpacaMain> {
  String dropdownValue = 'Limit';
  String dropdownValue1 = 'GTC';
  int shares = 1;
  int price = 2;
  List<bool> _selections = List.generate(2, (_) => false);
  bool margin = false;
  bool buySell = true;
  bool callPut = true;
  String bid = " ";
  String ask = " ";
  String lasttraded = " ";
  String change = " ";
  String name = " ";
  String symbol = " ";
  double assetValue = 0;
  double assetPrice = 0;
  double assetCurrentValue = 0;
  String assetCurrentPrice = "0";
  String assetChange = "0";
  String assetChangePercent = "0";
  String exchange = " ";
  String open_closed =" ";
  String cash = " ";
  String buyingPower = " ";
  String showCash = " ";
  bool showLimit = true;
  bool showLoader = true;
  // String side = "buy";
  funcOn(){
    print(showCash);
    if(showCash!=cash){
      setState(() {
        margin = false;
        showCash = cash;
        print("margin"+margin.toString());
      });
    }


  }
  funcOff(){
    print(showCash.length);
    if(showCash.length!=0){
      setState(() {
        margin = true;
        showCash = buyingPower;
        print("margin"+margin.toString());
      });
    }

  }
  placeOrder() async{
    var side;
    if(buySell==true){
      side = "buy";
    }
    else{
      side = "sell";
    }
    print(side + margin.toString() + symbol.toString() +shares.toString() + assetPrice.toString() + dropdownValue.toString() + dropdownValue1.toString());
    Response response=await post('https://w3tvz6ag78.execute-api.us-east-1.amazonaws.com/dev/stocks/createorder',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode({
          "userid":"1234userid",
          "margin":true,
          "symbol":"AAPL",
          "qty":1,
          "side":"buy",
          "type":"market",
          "time_in_force":"gtc",
          "limit_price":null,
          "stop_price":null,
          "stop_loss":null,
          "client_order_id":null,
          "order_class":null,
          "take_profit":null,
          "trail_price":null,
          "trail_percent":null

        }));
    Map data= await jsonDecode(response.body);
    print(data);
    return data["body"]["status"];
    print("your order can be executed");
  }
  createOrder(BuildContext context) async {
    if(assetValue<jsonDecode(showCash)){
      // const side;

       var x = await placeOrder();
        if(x=="accepted"){
          showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  content: Text("Your order has been placed"),
                  contentPadding: EdgeInsets.all(20),
                  actions: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    )
                  ],
                  title: Text("Place Order",
                  style:TextStyle(
                    fontSize: 15
                  )),
                );
              });
        }
        else{
          showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  content: Text("Your order can not be placed"),
                  contentPadding: EdgeInsets.all(20),
                  actions: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    )
                  ],
                  title: Text("Place Order",
                      style:TextStyle(
                          fontSize: 15
                      )),
                );
              });
        }


      print("your order can be executed");


    }
    else{
      print("your order can not be executed");
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              content: Text("Your order can not be exceuted because your current balance is less than the total asset amount"),
              contentPadding: EdgeInsets.all(20),
              actions: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
              title: Text("Place Order",
                  style:TextStyle(
                      fontSize: 15
                  )),
            );
          });
    }
    // Response response=await post('https://9q2d566izk.execute-api.us-east-1.amazonaws.com/dev/createpost',
    //     body: {
    //       "user_id":"1234userid",
    //       "summary":summary,
    //       "url":url,
    //       "image": postImage
    //     });
    // print(jsonDecode(response.body));
    // Map data=jsonDecode(response.body);
    // print(data['body']);
    // setState(() {
    //   // checkbutton=true;
    // });
  }
  bidData_data() async{
    BidData instance = BidData(ticker:"AAPL",userid:"1234userid");
    var x = await instance.returnBidData();
    var x1 = await instance.returnStockAlpacaData();
    var x2 = await instance.returnStockAlpacaPositions();
    var x3 = await instance.returnStockAlpacaAssets();
    var x4 = await instance.returnStockAlpacaAccountDetails();
    print(x4["body"]);
    double value = x["body"]["quote"]["bidprice"] - x["body"]["trade"]["price"];
    double value1 = jsonDecode(x2["body"]["change_today"]);
    setState(() {
      bid = x["body"]["quote"]["bidprice"].toString();
      ask = x["body"]["quote"]["askprice"].toString();
      lasttraded = x["body"]["trade"]["price"].toString();
      change = value.toStringAsFixed(3);
      name = x1["body"]["name"].toString();
      symbol = x1["body"]["symbol"].toString();
      assetCurrentPrice = x2["body"]["market_value"].toString();
      assetChange = x2["body"]["unrealized_pl"].toString();
      assetChangePercent = value1.toStringAsFixed(6);
      assetCurrentValue = jsonDecode(x2["body"]["current_price"]);
      assetValue = assetCurrentValue;
      assetPrice = assetCurrentValue;
      exchange = x3["body"]["assets"]["exchange"].toString();
      cash = x4["body"]["cash"];
      buyingPower = x4["body"]["buying_power"];
      showCash = cash;
      if(x3["body"]["clock"]["is_open"]==false){
        open_closed = "CLOSED";
      }
      else{
        open_closed = "OPEN";
      }
    });
    showLoader = false;
  }
  // stockAplaca_data() async{
  //   StockAlpacaData instance = StockAlpacaData(ticker:"AAPL");
  //   var x = await instance.returnStockAlpacaData();
  //   // print(x["body"]);
  //   // double value = x["body"]["quote"]["bidprice"] - x["body"]["trade"]["price"];
  //   setState(() {
  //     name = x["body"]["name"].toString();
  //     symbol = x["body"]["symbol"].toString();
  //   });
  //
  // }
  @override
  void initState() {
    super.initState();
    bidData_data();
  }
  @override
  Widget build(BuildContext context) {

    // stockAplaca_data();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          appBar:AppBar(
              backgroundColor: HexColor("#F8F9FC"),
              elevation: 2,
              titleSpacing: 0.0,
              title: Text("Back",
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  )
              ),

              leading:IconButton(

                icon:Icon(Icons.keyboard_backspace),
                color: Colors.black,
                iconSize: 25,
                onPressed: (){
                  Navigator.pop(context);

                },
              )) ,
            body:showLoader?Center(
              child: SpinKitRing(
                color:HexColor("#030389"),
                size: 50.0,
              ),
            ):
              Container(
                color: Colors.white,
                  child:SingleChildScrollView(
                      child:Column(
                        children:[
                          Container(
                            margin: EdgeInsets.all(18),
                            // color: Colors.blueGrey,
                            child:
                              Column(
                                children: [
                                  Container(
                                    height: 165,
                                    decoration: new BoxDecoration(
                                        color: HexColor("#121214"),
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(8.0),
                                          topRight: const Radius.circular(8.0),
                                          bottomLeft: const Radius.circular(8.0),
                                          bottomRight: const Radius.circular(8.0),
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height:82.5,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:EdgeInsets.fromLTRB(9,0,0,0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.fromLTRB(0,11,0,0),
                                                      child:Text(name,
                                                        style:TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18
                                                        ) ,
                                                      )
                                                    ),
                                                    Container(
                                                      margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                      child:Text(symbol,
                                                        style:TextStyle(
                                                            color: Colors.white54,
                                                            fontSize: 14
                                                        ),
                                                      )
                                                    )
                                                  ],
                                                ),

                                              ),
                                              Container(
                                                margin:EdgeInsets.fromLTRB(0,15,10,0),
                                                child:Image.asset("images/Past Day.png"),

                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height:82.5,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  margin:EdgeInsets.fromLTRB(0,11,0,0),
                                                  alignment:Alignment.centerLeft,
                                                  child:Text(" \u0024 "+assetCurrentPrice,
                                                          style:TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 31,
                                                              fontWeight:FontWeight.w400,

                                                          ) ,
                                                        )
                                                    ),
                                              Container(
                                                margin:EdgeInsets.fromLTRB(0,0,10,20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                        child:Text("\u0024 "+assetChange,
                                                          style:TextStyle(
                                                              color: Colors.white54,
                                                              fontSize: 14
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        // margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                        child:Text("("+assetChangePercent+"%)",
                                                          style:TextStyle(
                                                              color: Colors.white54,
                                                              fontSize: 14
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),

                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),//This is for buy sell toggle buttons
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    height: 46,
                                    // color: Colors.brown,
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // color: buySell,
                                          child: Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                height:40,
                                                decoration: ShapeDecoration(
                                                  color:buySell?HexColor("#121214"):Color.fromRGBO(239, 239, 239, 0.2),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.only(
                                                      topLeft: const Radius.circular(8.0),
                                                      topRight: const Radius.circular(0),
                                                      bottomLeft: const Radius.circular(8.0),
                                                      bottomRight: const Radius.circular(0),
                                                    ),
                                                    side: BorderSide(color: HexColor("#EFEFEF"))
                                                  ),
                                                ),
                                                child:
                                                FlatButton(
                                                    minWidth: 73,
                                                    onPressed: (){
                                                      setState(() {
                                                        buySell = true;
                                                      });
                                                    },
                                                    child: Text("BUY",
                                                      style: TextStyle(
                                                          color: buySell?Colors.white:HexColor("#A7B2C5")
                                                      ),
                                                    )),
                                              ),
                                              AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                height:40,
                                                decoration: ShapeDecoration(
                                                  color:buySell?Color.fromRGBO(239, 239, 239, 0.2):HexColor("#121214"),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(0),
                                                        topRight: const Radius.circular(8.0),
                                                        bottomLeft: const Radius.circular(0),
                                                        bottomRight: const Radius.circular(8.0),
                                                      ),
                                                      side: BorderSide(
                                                          color: HexColor("#EFEFEF")
                                                      )
                                                  ),
                                                ),
                                                child:FlatButton(
                                                  height:40,
                                                  minWidth: 73,
                                                  onPressed: (){
                                                    setState(() {
                                                      buySell = false;
                                                    });
                                                  },
                                                  // color: Color.fromRGBO(239, 239, 239, 0.2),
                                                  child: Text("SELL",
                                                    style: TextStyle(
                                                        color: buySell?HexColor("#A7B2C5"):Colors.white
                                                        // color: HexColor("#A7B2C5")
                                                    ),
                                                  )),
                                              ),
                                            ],
                                          ),

                                        ),
                                        Container(
                                          child:Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                height:40,
                                                decoration: ShapeDecoration(
                                                  color:callPut?HexColor("#121214"):Color.fromRGBO(239, 239, 239, 0.2),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(8.0),
                                                        topRight: const Radius.circular(0),
                                                        bottomLeft: const Radius.circular(8.0),
                                                        bottomRight: const Radius.circular(0),
                                                      ),
                                                      side: BorderSide(color: HexColor("#EFEFEF"))
                                                  ),
                                                ),
                                                child:
                                                FlatButton(
                                                    minWidth: 73,
                                                    onPressed: (){
                                                      setState(() {
                                                        callPut = true;
                                                      });
                                                    },
                                                    child: Text("CALL",
                                                      style: TextStyle(
                                                          color: callPut?Colors.white:HexColor("#A7B2C5")
                                                      ),
                                                    )),
                                              ),
                                              AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                curve: Curves.easeInOut,
                                                height:40,
                                                decoration: ShapeDecoration(
                                                  color:callPut?Color.fromRGBO(239, 239, 239, 0.2):HexColor("#121214"),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(0),
                                                        topRight: const Radius.circular(8.0),
                                                        bottomLeft: const Radius.circular(0),
                                                        bottomRight: const Radius.circular(8.0),
                                                      ),
                                                      side: BorderSide(
                                                          color: HexColor("#EFEFEF")
                                                      )
                                                  ),
                                                ),
                                                child:FlatButton(
                                                    height:40,
                                                    minWidth: 73,
                                                    onPressed: (){
                                                      setState(() {
                                                        callPut = false;
                                                      });
                                                    },
                                                    // color: Color.fromRGBO(239, 239, 239, 0.2),
                                                    child: Text("PUT",
                                                      style: TextStyle(
                                                          color: callPut?HexColor("#A7B2C5"):Colors.white
                                                        // color: HexColor("#A7B2C5")
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          )

                                        ),

                                      ],
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    height: 45,
                                    // color: Colors.blue,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("MARGIN CALL",
                                          style: TextStyle(
                                            fontSize: 12,
                                              color: HexColor("#B0BAC9"),
                                            fontWeight: FontWeight.w500
                                          ),

                                        ),
                                        Container(
                                          // height: 16,
                                          // width: 16,
                                          child:LiteRollingSwitch(

                                            textOn: "on",
                                            textOff: "off",
                                            iconOn: null,
                                            iconOff: null,
                                            value: false,
                                            showCash:showCash,
                                            cash:cash,
                                            buyingPower:buyingPower,
                                            funcOn:funcOn,
                                            funcOff:funcOff,
                                            // colorOn: Colors.white,
                                            onChanged: (bool state) {
                                              print(showCash);

                                              print('turned ${(state) ? 'on' : 'off'}');
                                              print(state.toString());
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(8),
                                    child:
                                      Container(
                                          height:72,
                                          // color:Colors.green,
                                          child:Row(
                                              children:[
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  height: 69,
                                                  width: 90,
                                                  decoration: ShapeDecoration(
                                                      color:HexColor("#F8F9FA"),
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(style: BorderStyle.solid,color: HexColor("#F8F9FA")),
                                                      borderRadius: BorderRadius.all(Radius.circular(7))
                                                    )
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin:EdgeInsets.fromLTRB(0,0,0,4),
                                                        child: Text("Bid",
                                                        style: TextStyle(
                                                          color: HexColor("#647992"),
                                                          fontSize: 16,
                                                          fontWeight:FontWeight.w500
                                                        )),
                                                      ),
                                                      Container(
                                                        child: Text(bid,
                                                            style: TextStyle(
                                                                color: HexColor("#8393AE"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.normal
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  height: 69,
                                                  width: 90,
                                                  decoration: ShapeDecoration(
                                                      color:HexColor("#F8F9FA"),
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(style: BorderStyle.solid,color: HexColor("#F8F9FA")),
                                                          borderRadius: BorderRadius.all(Radius.circular(7))
                                                      )
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin:EdgeInsets.fromLTRB(0,0,0,4),
                                                        child: Text("Ask",
                                                            style: TextStyle(
                                                                color: HexColor("#647992"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.w500
                                                            )),
                                                      ),
                                                      Container(
                                                        child: Text(ask,
                                                            style: TextStyle(
                                                                color: HexColor("#8393AE"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.normal
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  height: 69,
                                                  width: 90,
                                                  decoration: ShapeDecoration(
                                                      color:HexColor("#F8F9FA"),
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(style: BorderStyle.solid,color: HexColor("#F8F9FA")),
                                                          borderRadius: BorderRadius.all(Radius.circular(7))
                                                      )
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin:EdgeInsets.fromLTRB(0,0,0,4),
                                                        child: Text("Last Traded",
                                                            style: TextStyle(
                                                                color: HexColor("#647992"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.w500
                                                            )),
                                                      ),
                                                      Container(
                                                        child: Text(lasttraded,
                                                            style: TextStyle(
                                                                color: HexColor("#8393AE"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.normal
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  height: 69,
                                                  width: 90,
                                                  decoration: ShapeDecoration(
                                                      color:HexColor("#F8F9FA"),
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(style: BorderStyle.solid,color: HexColor("#F8F9FA")),
                                                          borderRadius: BorderRadius.all(Radius.circular(7))
                                                      )
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin:EdgeInsets.fromLTRB(0,0,0,4),
                                                        child: Text("Net Change",
                                                            style: TextStyle(
                                                                color: HexColor("#647992"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.w500
                                                            )),
                                                      ),
                                                      Container(
                                                        child: Text(change,
                                                            style: TextStyle(
                                                                color: HexColor("#E84A50"),
                                                                fontSize: 16,
                                                                fontWeight:FontWeight.normal
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),
                                  ),

                                ],
                              ),
                          ),//This is for closed or open
                          Container(
                            height: 45,
                            color: HexColor("#F8F9FA"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:EdgeInsets.fromLTRB(27,0,0,0),
                                  child:Text(exchange+": "+symbol,
                                  style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                   color: HexColor("#121214")
                                  )),

                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0,0,8,0),
                                      decoration: ShapeDecoration(

                                        shape: CircleBorder(
                                          side: BorderSide(width: 6.0, style: BorderStyle.solid,color:open_closed=="CLOSED"?HexColor("#E84A50"):Colors.green),
                                        ),
                                      ),

                                    ),
                                    Container(
                                        margin:EdgeInsets.fromLTRB(0,0,11,0),
                                        child:Text(open_closed,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: HexColor("#8798AD")
                                          )),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),// This is for type of share
                          Container(
                            margin: EdgeInsets.all(18),
                            height:390,

                            // color: Colors.greenAccent,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,31,0,0),
                                  alignment:Alignment.topLeft ,
                                  child:Text("TYPE",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#B0BAC9")
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,9.36,0,0),
                                  width:size.width*1,
                                  // color: Colors.red,
                                  alignment:Alignment.topLeft ,
                                    child:Container(
                                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        height: 41,
                                        width:size.width*0.9,
                                        decoration: ShapeDecoration(
                                            color: Color.fromRGBO(239, 239, 239, 0.2),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          ),
                                        ),
                                        child:DropdownButton<String>(

                                          value: dropdownValue,
                                          isExpanded: true,
                                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                                          iconSize: 24,
                                          elevation: 16,

                                          style: TextStyle(color:HexColor("#2E384D"),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                          ),
                                          underline: Container(
                                            height: 0
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              if(dropdownValue=="Market"){
                                                showLimit = false;
                                                assetPrice = null;
                                              }
                                              else{
                                                assetPrice = assetCurrentValue;
                                                showLimit = true;
                                              }
                                            });
                                          },
                                          items: <String>['Market', 'Limit', 'Stop']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                    ),

                                ),
                                Container(
                                    width: size.width,
                                    height: 52,
                                    // color: Colors.black26,
                                  margin: EdgeInsets.fromLTRB(0,35.63,0,0),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Container(
                                          height: 52,
                                        width: size.width*0.35,


                                          // color: Colors.black,
                                        child:Column(
                                          children: [
                                            Container(
                                              height: 22,
                                              child: Text("SHARES",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: HexColor("#B0BAC9")
                                              )),
                                              alignment:Alignment.topLeft,
                                            ),
                                            Container(
                                                height: 30,
                                                alignment: Alignment.bottomLeft,
                                                // color: Colors.black26,
                                              child:Row(
                                                children: [
                                                  Container(
                                                    width:25.6,
                                                    child:
                                                    FlatButton(
                                                      color: Color.fromRGBO(239, 239, 239, 0.2),
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                      ),
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                      // color: Colors.deepPurple,
                                                      // minWidth: 10,
                                                      height: 25.6,
                                                      onPressed: (){
                                                        setState(() {

                                                          shares = shares + 1;
                                                          assetValue = assetValue + assetCurrentValue;
                                                        });
                                                      },
                                                      child: Text("+",
                                                      style:TextStyle(
                                                          fontSize: 18,
                                                        color:HexColor("#121214")
                                                      )),


                                                    )

                                                  ),
                                                  Container(
                                                    margin:EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                    child:Text(shares.toString())
                                                  ),
                                                  Container(
                                                      width:25.6,
                                                      child:
                                                      FlatButton(
                                                        padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                        color: Color.fromRGBO(239, 239, 239, 0.2),
                                                        shape: RoundedRectangleBorder(
                                                          side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                        ),
                                                        // minWidth: 10,
                                                        height: 25.6,
                                                        onPressed: (){
                                                          setState(() {
                                                            if(shares==1){
                                                              shares = 1;
                                                              assetValue = assetCurrentValue ;
                                                            }
                                                            else{

                                                              shares = shares - 1;
                                                              assetValue = assetValue - assetCurrentValue;
                                                            }
                                                          });
                                                        },
                                                        child: Text("-",
                                                            style:TextStyle(
                                                                fontSize: 24,
                                                                color:HexColor("#121214")
                                                            )
                                                        ),

                                                      )
                                                  )
                                                ],
                                              )
                                            )
                                          ],
                                        )
                                      ),
                                      Container(
                                        // width: size.width*0.40,
                                          alignment:Alignment.topLeft,
                                        // color: Colors.red,
                                          child:showLimit?Column(
                                            // mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 22,
                                                child: Text("PRICE",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: HexColor("#B0BAC9")
                                                    )
                                                ),
                                                alignment:Alignment.topLeft,
                                              ),
                                              Container(

                                                  height: 30,
                                                  alignment: Alignment.topRight,
                                                  // color: Colors.black26,
                                                  child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          width:25.6,
                                                          child:
                                                          FlatButton(
                                                            color: Color.fromRGBO(239, 239, 239, 0.2),
                                                            shape: RoundedRectangleBorder(
                                                              side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                            ),
                                                            padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                            // color: Colors.deepPurple,
                                                            // minWidth: 10,
                                                            height: 25.6,
                                                            onPressed: (){
                                                              setState(() {
                                                                assetPrice = (assetPrice + 1);
                                                              });
                                                            },
                                                            child: Text("+",
                                                                style:TextStyle(
                                                                    fontSize: 18,
                                                                    color:HexColor("#121214")
                                                                )),


                                                          )

                                                      ),
                                                      Container(
                                                          margin:EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                          child:Text(assetPrice.toStringAsFixed(2))
                                                      ),
                                                      Container(
                                                          width:25.6,
                                                          child:
                                                          FlatButton(
                                                            padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                            color: Color.fromRGBO(239, 239, 239, 0.2),
                                                            shape: RoundedRectangleBorder(
                                                              side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                            ),
                                                            // minWidth: 10,
                                                            height: 25.6,
                                                            onPressed: (){
                                                              setState(() {
                                                                if(assetPrice == 0){
                                                                  assetPrice = 0;
                                                                }
                                                                else{
                                                                  assetPrice = assetPrice - 1;
                                                                }
                                                              });

                                                            },
                                                            child: Text("-",
                                                                style:TextStyle(
                                                                    fontSize: 24,
                                                                    color:HexColor("#121214")
                                                                )
                                                            ),

                                                          )
                                                      )
                                                    ],
                                                  )
                                              )
                                            ],
                                          ):Column(),
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,31,0,0),
                                  alignment:Alignment.topLeft ,
                                  child: Text("DURATION",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#B0BAC9")
                                      )),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,9.36,0,0),
                                  width:size.width*1,
                                  // color: Colors.red,
                                  alignment:Alignment.topLeft ,
                                  child:Container(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    height: 41,
                                    width:size.width*0.9,
                                    decoration: ShapeDecoration(
                                      color: Color.fromRGBO(239, 239, 239, 0.2),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color.fromRGBO(18, 18, 20, 0.1)),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                    ),
                                    child:DropdownButton<String>(

                                      value: dropdownValue1,
                                      isExpanded: true,
                                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 24,
                                      elevation: 16,

                                      style: TextStyle(color:HexColor("#2E384D"),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400
                                      ),
                                      underline: Container(
                                          height: 0
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue1 = newValue;
                                        });
                                      },
                                      items: <String>['DAY', 'GTC', 'OPG', 'CLS', 'IOC', 'FOK']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,39.63,0,0),
                                  child:FlatButton(
                                    color:Colors.black,
                                    height: 40,
                                    minWidth: 160,
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                    onPressed: (){
                                      createOrder(context);
                                    },
                                    child: Text("Place Order",
                                      style: TextStyle(color:HexColor("#FFFFFF"),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),)
                                  )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // alignment: Alignment.topLeft,
                            height: 45,
                            color: HexColor("#F8F9FA"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:EdgeInsets.fromLTRB(27,0,0,0),
                                  child:Text("Cost",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#647992")
                                      )),

                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0,0,11,0),
                                      child:Text(assetValue.toStringAsFixed(3)+" USD",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor("#647992")
                                          )),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 45,
                            color: HexColor("#F8F9FA"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:EdgeInsets.fromLTRB(27,0,0,0),
                                  child:Text("Cash Available",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#647992")
                                      )),

                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0,0,11,0),
                                      child:Text(showCash+" USD",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor("#647992")
                                          )),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ])
                  ),
              )

    );
  }
}
