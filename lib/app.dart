import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final double height;
  final Widget child;
  MyContainer({this.height, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.orangeAccent
      ),
      child: 
        child,
      

    );
  }
}