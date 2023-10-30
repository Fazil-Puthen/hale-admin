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

TextStyle detailfont(double size,Color color,FontWeight weight)
{
  return GoogleFonts.aBeeZee(fontSize: size,color:color,fontWeight: weight);
  
}

class TextbuttonContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  const TextbuttonContainer({required this.icon,
  required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 150,
    height: 30,
    decoration: BoxDecoration(
     border: Border.all(color: Colors.black.withOpacity(0.2)),
     borderRadius: BorderRadius.circular(5)
    ),
      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 15,),
          Text(text,style:detailfont(15, Colors.blue, FontWeight.normal),)
        ],
      ),
    );
  }
}

//product text field
class Productenterfield extends StatelessWidget {
  final String text;
  String? initial;
  final TextEditingController controller;
   Productenterfield({
    super.key,
    required this.text,
    required this.controller,
    this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: initial,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: text,
            labelStyle: detailfont(10,Colors.black.withOpacity(0.6), FontWeight.normal),
            hintStyle: headfont(10)),
      ),
    );
  }
}