import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_delete_event.dart';
part 'update_delete_state.dart';

class UpdateDeleteBloc extends Bloc<UpdateDeleteEvent, UpdateDeleteState> {
  UpdateDeleteBloc() : super(UpdateDeleteInitial()) {
    on<UpdateDeleteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ToupdateEvent>(toupdatehandler);
    on<UpdateProductevent>(updateproducthandler);
    on<DeleteProductevent>(deleteproducthandler);

  }
   final firestore= FirebaseFirestore.instance.collection('products');
   List image=[];

  FutureOr<void> toupdatehandler(ToupdateEvent event, Emitter<UpdateDeleteState> emit)async {
    // print('this is toupdatehandler');
    final documentsnapshot=await firestore.doc(event.id).get();
    
    if(documentsnapshot.exists){
    Map<String,dynamic> data=documentsnapshot.data() as Map<String,dynamic>;
    // image=data['imageurl'];
    // print('this are the images $image');
    final name=data['Name'];
    debugPrint(name);
    final brand=data['Brand'];
    final description=data['description'];
    final price=data['price'];
    // debugPrint('this is the $price');

    emit(ToupdateState(
      // images: image,
      name: name,
     brand: brand, 
     description: description, 
     price: price));
    }
    
  }

  FutureOr<void> updateproducthandler(UpdateProductevent event, Emitter<UpdateDeleteState> emit) async{
   return firestore.doc(event.id).update({
    'Name':event.name,
    'Brand':event.brand,
    'description':event.description,
    'price':event
    .price,
    }
   );
  }

  FutureOr<void> deleteproducthandler(DeleteProductevent event, Emitter<UpdateDeleteState> emit) {
    return firestore.doc(event.id).delete();
  }

}
