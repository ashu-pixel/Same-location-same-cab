import 'package:flutter/material.dart';

class UiContainer extends StatelessWidget {

  final Widget ch;
  final Color color;
  UiContainer(this.ch, this.color);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:20, vertical:5),
      margin: const EdgeInsets.symmetric(vertical:10),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(29)
      ),
      child: ch,
    );
  }
}