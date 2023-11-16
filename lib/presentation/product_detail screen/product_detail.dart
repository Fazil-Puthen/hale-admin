import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/dashboard%20screen/dashboard.dart';
import 'package:hale_backend/presentation/product_detail%20screen/bloc/product_detail_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/update_delete_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/product_update.dart';

class ProductDetail extends StatelessWidget {
  final AsyncSnapshot productdata;
  final int docindex;
   ProductDetail(
      {super.key, required this.productdata, required this.docindex});

  final widbox=SizedBox(width: 15,);

  @override
  Widget build(BuildContext context) {
    final value=productdata.data.docs[docindex];
    // final document=productdata.data.docs;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SizedBox(
          width: screenwidth*0.1,
        
        child: GridView.builder(
              itemCount: value['imageurl'].length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                print(index);
                return InkWell(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(value
                                ['imageurl'][index]))),
                  ),
                  onTap: () {
                    context
                        .read<ProductDetailBloc>()
                        .add(ImagePressedevent(index: index));
                  },
                );
              },
            ),
        ),
          widbox,
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
            buildWhen: (previous, current) => current is ImageDetailstate,
            builder: (context, state) {
              if(state is ImageDetailstate){
                final imageindex=state.index;
              return  Container(
                  height: screenheight*0.8,
                  width: screenwidth*0.3,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.2)),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                          image: NetworkImage(value
                              ['imageurl'][imageindex]))),
                );
              }
              else{
                return  SizedBox(width: screenwidth*0.3,
                  height: screenheight*0.8,
                  child: const Center(child: Text('Select an image for detailed view'),),);
              }
            },
          ),
          widbox,
          SizedBox(width: screenwidth*0.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(value['Name'],style:detailfont(25, Colors.black,FontWeight.w200) ,),
            box,
            Text('Brand: ${value['Brand']}',style: detailfont(15,Colors.black,FontWeight.w100),),
            box,
            Text('₹ ${value['price']}',style: detailfont(25, Colors.black, FontWeight.w400),),
            box,
            Text(value['description'],style: detailfont(13, Colors.black, FontWeight.w100),),
            box,
            Text('Category: ${value['category']}',style: detailfont(13,Colors.black, FontWeight.w100),),
            box,
            Text('Quantity available: ${value['quantity']}',style: detailfont(13,Colors.black, FontWeight.w100),),
            box,
            Row(children: [
              InkWell(onTap: () {
                String docID=value.id;
                print('this is the buttonclick for update');
                context.read<UpdateDeleteBloc>().add(ToupdateEvent(id: docID,index: docindex));
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UpdateProsuct(docid: 
                docID,productdata: productdata,)));
              },
                child:
               const TextbuttonContainer(icon: Icons.edit,text: 'Edit Product',)),
              widbox,
               InkWell(
                onTap: () {
                  String docID=value.id;
                  context.read<UpdateDeleteBloc>().add(DeleteProductevent(id:docID));
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const Dashboard()), (route) => false);
                },
                child: const TextbuttonContainer(icon: Icons.delete,text: 'Delete Product',))],)]),
          ),)
        ],
      ),
    );
  }
}
