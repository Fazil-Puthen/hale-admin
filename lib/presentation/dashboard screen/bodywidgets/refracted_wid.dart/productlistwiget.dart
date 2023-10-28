import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';
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
            
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetail(productdata: productdata,)));
          },
          child:
         Card(
           child: ListTile(title: Text(value['Name']),
           subtitle: Text(value['Brand']),
            leading: CircleAvatar(backgroundImage:NetworkImage(firstimage)),
            trailing:IconButton(onPressed: (){
 
            }, 
            icon: Icon(Icons.edit))
           ),
         ));
      },

      itemCount: productdata.data.docs.length);
  }
}