// import 'package:flutter/material.dart';

// class Screensize {
//   final BuildContext context;
//   Screensize({required this.context})

//   double get screenwidth => MediaQuery.of(context).size.width;
//   double get screenheight => MediaQuery.of(context).size.height;


// }

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final pinkcolor=Colors.pink.withOpacity(0.2);
const hale='assets/Hale.png';
const box=SizedBox(height: 15,);

TextStyle headfont(double size)
{
  return GoogleFonts.aBeeZee(fontSize: size,color:Colors.pink);
  
}