import 'package:flutter/material.dart';
import 'dart:async';
import 'QuizPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home://RadioWidgetDemo(),
      QuizPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  int start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Quiz"),
              backgroundColor: Colors.red,
      ),
      body:Center(
        child: MaterialButton(
          color: Colors.greenAccent,
          child: Text("Start Quiz",
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color:Colors.red
          )),
          onPressed: (){
            startTimer();
            Navigator.push(context, MaterialPageRoute(builder:(_)=>QuizPage()));
          },
        ),
      )
    );
  }
}
