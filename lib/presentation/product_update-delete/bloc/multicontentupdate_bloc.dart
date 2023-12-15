import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'multicontentupdate_event.dart';
part 'multicontentupdate_state.dart';

class MulticontentupdateBloc extends Bloc<MulticontentupdateEvent, MulticontentupdateState> {
  MulticontentupdateBloc() : super(MulticontentupdateInitial()) {
    on<MulticontentupdateEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Fetchupdateimageevent>(fetchimagehandler);
    on<AddimageEvent>(addimagehandler);
    on<DeleteimageEvent>(deleteimagehandler);
    on<UpdateProductimageevent>(updateimagehandler);
  }
  final firestore=FirebaseFirestore.instance.collection('products');
  List<PlatformFile?> pickedfile=[];
  List image=[];

  FutureOr<void> fetchimagehandler(Fetchupdateimageevent event, Emitter<MulticontentupdateState> emit) async{
    image.clear();
    final document= await firestore.doc(event.id).get();

     if(document.exists){
    Map<String,dynamic> data=document.data() as Map<String,dynamic>;
    image=data['imageurl'];
  }
  emit(ImagefethsuccessState(imagelist: image));
}
  //add new image
  FutureOr<void> addimagehandler(AddimageEvent event, Emitter<MulticontentupdateState> emit) async{
    emit(Addimageloadingstate());
    pickedfile.clear();
      try{
        FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
       if(result!=null){
      pickedfile.addAll(result.files);
       for(var file in pickedfile){
     final storage=FirebaseStorage.instanceFor(bucket:'gs://hale-54ebc.appspot.com' );
     final storageref=storage.ref().child('productimages/${file!.name}');
     final metadata=SettableMetadata(contentType: 'image/*');
     UploadTask uploadtask=storageref.putData(file.bytes!,metadata);

     TaskSnapshot snapshot=await uploadtask.whenComplete(() => null);

     String imageurl=await snapshot.ref.getDownloadURL();
     image.add(imageurl);
  }
  emit(ImagefethsuccessState(imagelist: image));
      } 
      }
      catch(e){
        debugPrint('this is the error ${e.toString()}');
      } 
}
  FutureOr<void> deleteimagehandler(DeleteimageEvent event, Emitter<MulticontentupdateState> emit)async {
   await image.removeAt(event.index);
   emit(ImagefethsuccessState(imagelist: image));
  }

  FutureOr<void> updateimagehandler(UpdateProductimageevent event, Emitter<MulticontentupdateState> emit) async{
    await firestore.doc(event.id).update({
      'imageurl':image
    });
  }
}