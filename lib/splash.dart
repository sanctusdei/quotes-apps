import 'package:flutter/material.dart';
import 'package:staymotivated/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 125, bottom: 180),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo.gif",
                        height: 250.0,
                        width: 250.0,
                      ),
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontFamily: 'NeoSans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
