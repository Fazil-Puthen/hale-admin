import 'package:flutter/material.dart';

class Messagewidget extends StatelessWidget {
  const Messagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(width: 300,
      height: 300,
        child: Center(child: Text('message'),),
      ),
    );
  }
}