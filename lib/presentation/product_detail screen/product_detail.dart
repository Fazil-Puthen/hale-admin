import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final AsyncSnapshot productdata;
  const ProductDetail({super.key, required this.productdata});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/Hale.png',
          scale: 5,
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenwidth * 0.2,
            child: GridView.builder(
              itemCount:2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 1),
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(productdata.data.docs[0]
                              ['imageurl'][index]))),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
