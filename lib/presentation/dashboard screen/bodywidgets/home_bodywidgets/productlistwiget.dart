import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/product_detail%20screen/bloc/product_detail_bloc.dart';
import 'package:hale_backend/presentation/product_detail%20screen/product_detail.dart';

class ProductListbuild extends StatelessWidget {
  final AsyncSnapshot productdata;
  const ProductListbuild({
    super.key,required this.productdata,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      itemBuilder:(context, index) {
         Map<String, dynamic> value = productdata.data.docs[index].data() as Map<String, dynamic>;
        String firstimage=value['imageurl'][0];
        // final id=productdata.data.docs(id);
        // debugPrint(id);
    
        return 
        InkWell(
          onTap: () {
            
            context
             .read<ProductDetailBloc>()
             .add(ImagePressedevent(index:0));

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>ProductDetail(productdata:productdata,docindex:index)));
          },
          child:
         Card(
           child: ListTile(title: Text(value['Name'],style: detailfont(15, Colors.black, FontWeight.w200),),
           subtitle: Text(value['Brand'],style: detailfont(10, Colors.black, FontWeight.normal),),
            leading: Container(width: 50,height: 50,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(firstimage))),),
            trailing:Text('₹ ${value['price']}',style: detailfont(15, Colors.black, FontWeight.w300),),
            
           ),
         ));
      },

      itemCount: productdata.data.docs.length);
  }
}