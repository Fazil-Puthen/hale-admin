import 'package:flutter/material.dart';

class Loadigwidget extends StatelessWidget {
  const Loadigwidget({
    super.key,
    required this.screenwidth,
    required this.screenheight,
  });

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: screenwidth,
    height: screenheight*0.8,
    child: const Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularProgressIndicator(),
        Text('Loading data')
      ],
    ),),);
  }
}