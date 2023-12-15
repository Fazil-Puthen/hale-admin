import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';

class Dashcard extends StatelessWidget {
  final String heading;
  final IconData icon;
  final String count;
  const Dashcard({
    required this.heading,
    required this.count,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      elevation: 110,
      shadowColor: pinkcolor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: pinkcolor),
          color: Colors.white,
        ),
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 40,
              weight: .5,
            ),
            Text(
              heading,
              style: detailfont(20, Colors.black, FontWeight.bold),
            ),
           const  SizedBox(
              height: 10,
            ),
            Text(
              count,
              style: detailfont(25, Colors.red, FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}