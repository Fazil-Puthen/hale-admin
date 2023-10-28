import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/add_product.dart';

class Dashwidget extends StatelessWidget {
  const Dashwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return  
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,
      vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Card(color: Colors.white,
              child: Container(
                width: screenwidth*0.8,
                height: screenheight*0.5,
            
              ),
            )
        
        ],
      ),
    );
  }
}