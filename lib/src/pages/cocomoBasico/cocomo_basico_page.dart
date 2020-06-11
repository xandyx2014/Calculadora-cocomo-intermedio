import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class CocomoBasicoPage extends StatelessWidget {
  final pages = [
    Container(
        width: double.maxFinite,
        color: Colors.pinkAccent,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Que etc quasdauisdnasda?',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 200.0,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(
                    decorationColor: Colors.white, color: Colors.white),
              ),
            )
          ],
        ))),
    Container(color: Colors.purple, child: Center(child: Text('hi'))),
    Container(color: Colors.teal, child: Center(child: Text('hi'))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:  LiquidSwipe(
                  pages: pages
              ),
        ));
  }
}
