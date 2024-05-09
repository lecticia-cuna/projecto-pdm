import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duracao = Duration(seconds: 5);
    return new Timer(duracao, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Center(
            child: Container(
              child: Image(
                image: AssetImage(
                  "assets/icons/toll.png",
                ),
                width: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
