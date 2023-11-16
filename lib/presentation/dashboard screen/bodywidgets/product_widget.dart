import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/add_product.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/home_bodywidgets/productlistwiget.dart';

class Productwidget extends StatelessWidget {
  const Productwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final sreenheight=MediaQuery.of(context).size.height;
    return  Container(width: screenwidth,
    // height: sreenheight*0.7,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
         Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [  InkWell(
          onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddProduct()));},
           child:  const TextbuttonContainer(icon: Icons.add,text:'Add Product',),
         ),
         box,
          Text('Added Products',style: detailfont(20, Colors.black, FontWeight.w200),),
          Card(elevation: 10,
            child: Container(width: screenwidth*0.8,
            height: sreenheight*0.5,
            child: 
            
            StreamBuilder(stream: FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, AsyncSnapshot  snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }

              else if(snapshot.data.docs.isEmpty){
                return const Center(child: Text('No product added'),);
              }

              else if(snapshot.hasData){
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductListbuild(productdata: snapshot,),
                );
              }

              else if(snapshot.hasError){
                return const Center(child: Text('no data available'),);
              }
                   
                else{
                return const Text('no network');
              }
            },),),
          )],
        ),
      )
    );
  }
}


