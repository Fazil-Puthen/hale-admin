import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:meta/meta.dart';
part 'addproduct_event.dart';
part 'addproduct_state.dart';

class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  AddproductBloc() : super(AddproductInitial()) {
    on<AddproductEvent>((event, emit) {
    });
    on<AddProductdtoFirestore>(addtofirestore);
    on<PickImageevent>(pickimagehandler);
  }
  
  List<PlatformFile?> pickedfile=[];
  List<String> imageurls=[];

  FutureOr<void> addtofirestore(AddProductdtoFirestore event, Emitter<AddproductState> emit)async {
       try {
        
      if(pickedfile!=null){
           for(var file in pickedfile){
        await uploadtostorage(file!);
      }
      }
      await FirebaseFirestore.instance.collection('products').add({
        'Nmae': event.name,
        'Brand': event.brand,
        'description': event.description,
        'price': event.price,
        'imageurl':imageurls
      });
      imageurls.clear();
      print(event.name);
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> pickimagehandler(PickImageevent event, Emitter<AddproductState> emit)async {
      try{
        FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
       if(result!=null){
      pickedfile=result.files;
      debugPrint('this is imagedata ${pickedfile.length.toString()}');
      } 
      }
      catch(e){
        debugPrint('this is the error ${e.toString()}');
      } 
  }
  
  Future<void> uploadtostorage(PlatformFile file)async {
   final storage=FirebaseStorage.instanceFor(bucket:'gs://hale-54ebc.appspot.com' );
   final storageref=storage.ref().child('productimages/${file.name}');
   UploadTask uploadtask=storageref.putData(file.bytes!);

   TaskSnapshot snapshot=await uploadtask.whenComplete(() => null);

   String imageurl=await snapshot.ref.getDownloadURL();
   imageurls.add(imageurl);
   debugPrint('this is imageurl==$imageurls');
  }
  

  }

