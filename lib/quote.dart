import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('quotes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 150, left: 20),
                            child: Text("Today's",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontFamily: 'NeoSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              "assets/master.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                                snapshot.data!.docs.elementAt(index)['quote'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NeoSans',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20.0)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data!.docs.elementAt(index)['author'],
                            style: TextStyle(
                                color: Colors.yellow,
                                fontFamily: 'NeoSans',
                                fontSize: 15.0)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Center(
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(snapshot.data!.docs.elementAt(index)['jobs'],
                            style: TextStyle(
                                color: Colors.yellow,
                                fontFamily: 'NeoSans',
                                fontSize: 15.0)),
                      ],
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
        },
      ),
    );
  }
}
