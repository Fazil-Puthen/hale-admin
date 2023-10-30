import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/add%20product%20widgets/image_select_widget.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/update_delete_bloc.dart';

class UpdateProsuct extends StatelessWidget {
  final String docid;
  final AsyncSnapshot productdata;
  UpdateProsuct({super.key, required this.docid, required this.productdata});

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
              child: BlocBuilder<UpdateDeleteBloc, UpdateDeleteState>(
                builder: (context, state) {
                  if(state is ToupdateState){
                    namecontroller.text=state.name!;
                    brandcontroller.text=state.brand!;
                    descriptioncontroller.text=state.description!;
                    pricecontroller.text=state.price!;
                  return Column(
                    children: [
                      box,
                      Text(
                        'Update  Product Details',
                        style: headfont(20),
                      ),
                      box,
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<AddproductBloc>()
                                .add(PickImageevent());
                          },
                          child: Text('Add images'),
                        ),
                      ),
                      box,
                      ImageContainer(
                          screenwidth: screenwidth, screenheight: screenheight),
                      box,
                      Productenterfield(
                        text: 'Product Nmae',
                        initial: state.name,
                        controller: namecontroller,
                      ),
                      box,
                      Productenterfield(
                          text: 'Product Brand',
                        initial: state.brand,
                        controller: brandcontroller,
                      ),
                      box,
                      Productenterfield(
                       text: 'Description',
                        initial: state.description,
                        controller: descriptioncontroller,
                      ),
                      box,
                      Productenterfield(
                        text: 'Price',
                        initial: state.price,
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
                          context
                              .read<UpdateDeleteBloc>()
                              .add(UpdateProductevent(
                                name: namecontroller.text,
                                brand: brandcontroller.text,
                                description: descriptioncontroller.text,
                                price: pricecontroller.text,
                                id:docid,
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
                              'update Product',
                              style: GoogleFonts.aBeeZee(),
                            ),
                          ),
                        ),
                      ),
                      box,
                    ],
                  );}
                  else{
                    return const Center(child: Text('Error fetching data'),);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
