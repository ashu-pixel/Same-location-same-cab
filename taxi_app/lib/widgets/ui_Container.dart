import 'package:flutter/material.dart';

class UiContainer extends StatelessWidget {

  final Widget ch;
  final Color color;
  final double width;
  UiContainer(this.ch, this.color, this.width);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:20, vertical:5),
      margin: const EdgeInsets.symmetric(vertical:10),
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(29)
      ),
      child: ch,
    );
  }
}

