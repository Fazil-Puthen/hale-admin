import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';

class Subdashcard extends StatelessWidget {
  final String heading;
  final String count;
  final Color headcolor;
  final Color containercolor;
  const Subdashcard(
      {super.key,
      required this.heading,
      required this.count,
      required this.headcolor,
      required this.containercolor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.black),
            color: containercolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              style: detailfont(15, headcolor, FontWeight.bold),
            ),
            Text(
              count,
              style: detailfont(15, Colors.white, FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}