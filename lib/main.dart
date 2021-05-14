import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photoshoptutorial/screens/button_screen.dart';
import 'package:photoshoptutorial/screens/beginner_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // to hide only bottom bar:
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);

    // to hide only status bar:
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);

    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ButtonScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("images/pst.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              "Photoshop Tutorial",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
