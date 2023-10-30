import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';
import 'package:hale_backend/presentation/add_product%20screen/add%20product%20widgets/image_select_widget.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final namecontroller = TextEditingController();
  final brandcontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  List<String> gender=['Men','Woman'];
  var selecteditem='Men';

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
                  Center(child: ElevatedButton(
                    onPressed: () {
                    context.read<AddproductBloc>().add(PickImageevent());
                  },
                  child: Text('Add images'),),),
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
                  
                  // DropdownButton(
                  //   value:selecteditem ,
                  //   items:List<DropdownMenuItem>.from(gender),
                  // onChanged:(value) {
                  //   selecteditem=value;
                  // },),

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



