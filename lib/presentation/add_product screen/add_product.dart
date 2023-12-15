import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';
import 'package:hale_backend/presentation/add_product%20screen/add%20product%20widgets/image_select_widget.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final namecontroller = TextEditingController();

  final brandcontroller = TextEditingController();

  final descriptioncontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  final quantitycontroller = TextEditingController();

  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // List<bool> selection = List.filled(category.length, false);
    // Color selectedcolor=Colors.black.withOpacity(0.7);
    String selectedcategory = '';
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AddproductBloc>().add(PickImageevent());
                      },
                      child: const Text('Add images'),
                    ),
                  ),
                  box,
                  ImageContainer(
                      screenwidth: screenwidth, screenheight: screenheight),
                  box,
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Productenterfield(
                          text: 'Product Name',
                          controller: namecontroller,
                          validate: 'Product name is mandatory',
                        ),
                        box,
                        Productenterfield(
                          text: 'Product Brand',
                          controller: brandcontroller,
                          validate: 'Brand is mandatory',
                        ),
                        box,
                        Productenterfield(
                          text: 'Description',
                          controller: descriptioncontroller,
                          validate: 'Description is mandatory',
                        ),
                        box,
                        Productenterfield(
                          text: 'price',
                          controller: pricecontroller,
                          validate: 'Price is mandatory',
                        ),
                        box,
                        Productenterfield(
                        text: 'Quantity',
                        controller: quantitycontroller,
                        validate: 'Quantity is mandatory',),
                        
                      ],
                    ),
                  ),
                  box,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select a Category',
                          style: detailfont(17, Colors.black, FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      SizedBox (
                          width: screenwidth * 0.5,
                          height: 25,

                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                              return BlocConsumer<AddproductBloc, AddproductState>(
                                listenWhen:(previous, current) => current is Buttonstate ,
                                listener: (context, state) {
             
                                },
                                builder: (context, state) {
                                  return OutlinedButton(
                                      onPressed: () {
                                        context.read<AddproductBloc>().add(
                                            Onbuttonpressedevent(index: index));
                                        selectedcategory = category[index];
                                      },
                                      autofocus: true,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        category[index],
                                        style: detailfont(10, Colors.black,
                                            FontWeight.normal),
                                      ));
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  box,

                  InkWell(
                    onTap: () {
                      if(formkey.currentState!.validate()){
                      context.read<AddproductBloc>().add(AddProductdtoFirestore(
                          name: namecontroller.text,
                          brand: brandcontroller.text,
                          description: descriptioncontroller.text,
                          price: int.parse(pricecontroller.text),
                          quantitiy: int.parse(quantitycontroller.text),
                          category: selectedcategory));
                      Navigator.pop(context);
                    }},
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
