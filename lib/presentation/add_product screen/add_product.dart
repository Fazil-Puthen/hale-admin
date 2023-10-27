import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';


class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final namecontroller = TextEditingController();
  final brandcontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final pricecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Image.asset(
          hale,
          scale: 5,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenwidth * 0.2, vertical: 10),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  box,
                  Text(
                    'Fill out the Product Details',
                    style: headfont(20),
                  ),
                  box,
                  ImageContainer(
                      screenwidth: screenwidth, screenheight: screenheight),
                  box,
                  Productenterfield(
                    text: 'Product Name',
                    controller: namecontroller,
                  ),
                  box,
                  Productenterfield(
                    text: 'Product Brand',
                    controller: brandcontroller,
                  ),
                  box,
                  Productenterfield(
                    text: 'Description',
                    controller: descriptioncontroller,
                  ),
                  box,
                  Productenterfield(
                    text: 'price',
                    controller: pricecontroller,
                  ),
                  box,
                  InkWell(
                    onTap: () {
                      context.read<AddproductBloc>().add(AddProductdtoFirestore(
                        name: namecontroller.text,
                        brand: brandcontroller.text,
                        description: descriptioncontroller.text,
                        price: pricecontroller.text,
                      ));
                      Navigator.pop(context);
                    },
              
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: pinkcolor),
                        child: Center(
                          child: Text(
                            'Add Product',
                            style: GoogleFonts.aBeeZee(),
                          ),
                        ),
                      ),
                    ),
                  box,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//image container
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.screenwidth,
    required this.screenheight,
  });

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth * 0.5,
      height: screenheight * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.5)),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: InkWell(
            onTap: () {
            context.read<AddproductBloc>().add(PickImageevent());
            },
            child: Container(
              width: screenwidth * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  Text(
                    'Add Images',
                    style: headfont(10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//product text field
class Productenterfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const Productenterfield({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: text,
          hintStyle: headfont(10)),
    );
  }
}
