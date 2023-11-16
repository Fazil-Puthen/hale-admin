import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'addproduct_event.dart';
part 'addproduct_state.dart';

class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  AddproductBloc() : super(AddproductInitial()) {
    on<AddproductEvent>((event, emit) {
    });
    on<AddProductdtoFirestore>(addtofirestore);
    on<PickImageevent>(pickimagehandler);
    on<EditSelectedimageevent>(editselectimagehandler);
    on<ImageDeleteEvent>(imagedeletehandler);
    on<Onbuttonpressedevent>(buttonpressedhandler);
  }
  
  List<PlatformFile?> pickedfile=[];
  List<String> imageurls=[];

  FutureOr<void> addtofirestore(AddProductdtoFirestore event, Emitter<AddproductState> emit)async {
   try {
      for(var file in pickedfile){
      await uploadtostorage(file!);
      }
      await FirebaseFirestore.instance.collection('products').doc(DateTime.now().toString()).set({
        'Name': event.name,
        'Brand': event.brand,
        'description': event.description,
        'price': event.price,
        'quantity':event.quantitiy,
        'category':event.category,
        'imageurl':imageurls
      });
      pickedfile.clear();
      imageurls.clear();
      emit(Firestoresavedstate());
    } 
    catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> pickimagehandler(PickImageevent event, Emitter<AddproductState> emit)async {
      try{
        FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
       if(result!=null){
      pickedfile.addAll(result.files);
      emit(Gallerypicked(pickedfile));
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
   final metadata=SettableMetadata(contentType: 'image/*');
   UploadTask uploadtask=storageref.putData(file.bytes!,metadata);

   TaskSnapshot snapshot=await uploadtask.whenComplete(() => null);

   String imageurl=await snapshot.ref.getDownloadURL();
   imageurls.add(imageurl);
   debugPrint('this is imageurl==$imageurl');
  }
  

  
  FutureOr<void> editselectimagehandler(EditSelectedimageevent event, Emitter<AddproductState> emit) {
  }
  
  FutureOr<void> imagedeletehandler(ImageDeleteEvent event, Emitter<AddproductState> emit) {
    pickedfile.removeAt(event.index);
    emit(Gallerypicked(pickedfile));
  }
  
  FutureOr<void> buttonpressedhandler(Onbuttonpressedevent event, Emitter<AddproductState> emit) {
  }
  }

