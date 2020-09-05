import 'package:flutter/material.dart';
import 'package:pymbo/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';
 
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 20,
      imageBackground: AssetImage('assets/img/background.jpg'),
      navigateAfterSeconds: HomePage(),
      loaderColor: Colors.white,
      backgroundColor: Color(0xfff1faee),
      );
  }
}
