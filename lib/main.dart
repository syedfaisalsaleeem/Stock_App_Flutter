import 'package:flutter/material.dart';
// import 'package:slak/Learning/Action_Video.dart';
import 'package:slak/alpacaStock/alpacaMain.dart';
// import 'package:slak/components/AppWidget.dart';
import 'package:slak/constant.dart';
import 'package:slak/createpost/camera.dart';
// import 'package:slak/screens/landing/landing.dart';
// import 'package:slak/createpost/createpost.dart';
import 'package:camera/camera.dart';
List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    // print(cameras);
    // print("this is camera");
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainAppName,
      theme: ThemeData(
      ),
      // home: CameraExampleHome(cameras: cameras),
      //  home:CreatePost(cameras: cameras)
         home:AlpacaMain()
    );
  }
}
//
/// Flutter code sample for NestedScrollView

// This simple example shows a [NestedScrollView] whose header contains a
// floating [SliverAppBar]. By using the [floatHeaderSlivers] property, the
// floating behavior is coordinated between the outer and inner [Scrollable]s,
// so it behaves as it would in a single scrollable.

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }
//
// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   MyStatelessWidget({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: NestedScrollView(
//           // Setting floatHeaderSlivers to true is required in order to float
//           // the outer slivers over the inner scrollable.
//             floatHeaderSlivers: true,
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 SliverAppBar(
//                   title: const Text('Floating Nested SliverAppBar'),
//                   floating: true,
//                   expandedHeight: 200.0,
//                   forceElevated: innerBoxIsScrolled,
//                 ),
//               ];
//             },
//             body:Container(
//                 child:Column(
//                   children:[
//                     Container(
//                       height: 50,
//                       width: 50,
//                       color: Colors.grey,
//                       child: Center(child: Text('Item')),
//                     ),
//                     SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children:[
//                               Container(
//                                 height: 50,
//                                 width: 550,
//                                 child: Center(child: Text('Item')),
//                               ),
//                               Container(
//                                 height: 50,
//                                 width: 550,
//                                 child: Center(child: Text('Item')),
//                               )
//                             ]
//                           ),
//                 )])
//               )
//         )
//     );
//   }
// }