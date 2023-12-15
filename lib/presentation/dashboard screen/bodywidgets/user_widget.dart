import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/home_bodywidgets/refracted%20widgets/userliatview.dart';

class Userwidget extends StatelessWidget {
 const Userwidget({super.key});
  
 
   
  @override
   Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    // final screenheight=MediaQuery.of(context).size.height;
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Container(width:screenwidth*0.8 ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white),
          height: 300,
            child: 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: StreamBuilder(stream: FirebaseFirestore.instance.collection('users').snapshots(),
                 builder: (context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.connectionState==ConnectionState.none){
                    return const Center(child: Text('no data '),);
                  }
                  else if(snapshot.hasData){
                   return Userlistrow(userdata: snapshot,);}
                   else{
                    return const Center(child: Text('no network'));
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

