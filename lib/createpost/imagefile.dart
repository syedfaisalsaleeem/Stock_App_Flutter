// import 'package:http/http.dart';
// import 'dart:convert';
// import 'package:intl/intl.dart';
import 'package:camera/camera.dart';

class ImageFile {
  String file; // location name for the UI
  ImageFile({this.file});

  // Future<void> getTime() async{
  //   try{
  //     Response response=await get('http://worldtimeapi.org/api/timezone/$url');
  //     Map data=jsonDecode(response.body);
  //     print(data);
  //     //  get properties from data
  //     String datetime=data['datetime'];
  //     String offset=data['utc_offset'].substring(1,3);
  //     print(datetime);
  //     print(offset);
  //     //  create DateTime object
  //     DateTime now= DateTime.parse(datetime);
  //
  //     var y=now.add(Duration(hours: int.parse(offset)));
  //     isDaytime=y.hour>6 && y.hour <20 ? true: false;
  //     time=DateFormat.jm().format(y);
  //     // time= y.toString();
  //     print(now);
  //     print(y);
  //   }
  //   catch(e){
  //     print(e);
  //     time="could not get time data";
  //   }
  //
  // }

}

// WorldTime instance= WorldTime(location:"Berlin",flag:"germany.png",url:"Europe/Berlin");
// instance.getTime()