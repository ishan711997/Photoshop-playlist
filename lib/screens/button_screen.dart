import 'package:flutter/material.dart';
import 'package:photoshoptutorial/screens/advanced_screen.dart';
import 'package:photoshoptutorial/screens/beginner_screen.dart';
import 'package:photoshoptutorial/screens/intermediate_screen.dart';
import 'package:launch_review/launch_review.dart';

class ButtonScreen extends StatefulWidget {
  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(16.0),
        color: Colors.indigo,
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset("images/pst.png"),
            ),
            SizedBox(
              height: 10,
            ),

            //=============Beginner
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                padding: EdgeInsets.only(right: 0, left: 0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent[200], Colors.blue[900]],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "Beginner",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BeginnerScreen();
                  }));
                }),

            //==============Intermediate
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                padding: EdgeInsets.only(right: 0, left: 0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent[200], Colors.blue[900]],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "Intermediate",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IntermediateScreen();
                  }));
                }),

            //===============Advanced
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                padding: EdgeInsets.only(right: 0, left: 0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent[200], Colors.blue[900]],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "Advanced",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdcancedScreen();
                  }));
                }),

            //==============Rate Button
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              padding: EdgeInsets.only(right: 0, left: 0),
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                  alignment: Alignment.center,
                  child: Text(
                    "Please Rate Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              onPressed: () {
                LaunchReview.launch(
                    androidAppId: "com.gamelien.photoshoptutorial");
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),

            //
          ],
        ),
      ),
    );
  }
}
