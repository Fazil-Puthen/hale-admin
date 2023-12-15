import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/multicontentupdate_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/update_delete_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/refracted_widgets/updateimagecontainer.dart';

class UpdateProsuct extends StatelessWidget {
  final String docid;
  final AsyncSnapshot productdata;
  UpdateProsuct({super.key, required this.docid, required this.productdata});

  final namecontroller = TextEditingController();

  final brandcontroller = TextEditingController();

  final descriptioncontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  final formkey=GlobalKey<FormState>();

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
                    namecontroller.text=state.name;
                    brandcontroller.text=state.brand;
                    descriptioncontroller.text=state.description;
                    pricecontroller.text=state.price.toString();
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
                                .read<MulticontentupdateBloc>()
                                .add(AddimageEvent());
                          },
                          child: const Text('Add images'),
                        ),
                      ),
                      box,
                      UpdateImageContainer(
                          screenwidth: screenwidth, screenheight: screenheight),
                      box,
                      Form(key: formkey,
                        child: Column(
                          children: [
                            Productenterfield(
                              text: 'Product Name',
                              controller: namecontroller,
                              validate: 'product name is mandatory',
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
                              text: 'Price',
                              controller: pricecontroller,
                              validate: 'Price is mandatory',
                            ),
                          ],
                        ),
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
                          if(formkey.currentState!.validate()){
                          context.read<MulticontentupdateBloc>().add(UpdateProductimageevent(id:docid));
                          context
                              .read<UpdateDeleteBloc>()
                              .add(UpdateProductevent(
                                name: namecontroller.text,
                                brand: brandcontroller.text,
                                description: descriptioncontroller.text,
                                price: int.parse(pricecontroller.text),
                                id:docid,
                              ));
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
