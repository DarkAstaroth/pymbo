import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pymbo/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark
  ));
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
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
      imageBackground: AssetImage('assets/img/splash2.jpg'),
      navigateAfterSeconds: HomePage(),
      loaderColor: Colors.red,
      backgroundColor: Color(0xfff1faee),
    );
  }
}
