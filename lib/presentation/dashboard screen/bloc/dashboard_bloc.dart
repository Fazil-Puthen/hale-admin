import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
    });
    on<WidgetchangeEvent>(changeevnthandler);
    on<Dashboardinitevent>(dashinithandler);
  }
  final firestore=FirebaseFirestore.instance;

  FutureOr<void> changeevnthandler(WidgetchangeEvent event, Emitter<DashboardState> emit) {
    if(event.index==1){
      emit(Homeboardstate());
    }
    else if(event.index==2){
      emit(Productstate());
    }
    else if(event.index==3){
      emit(Userstate());
    }
    else{
      emit(Messagestate());
    }
  }

 FutureOr<void> dashinithandler(Dashboardinitevent event, Emitter<DashboardState> emit)async {
  emit(Loadingstate());
    final products=await firestore.collection('products').get();
    final users=await firestore.collection('users').get();
    final productlength=products.docs.length;
    final userlength=users.docs.length;

    for(String proCategory in category){
       List<DocumentSnapshot> productsInCategory = products.docs
          .where((product) => product['category'] == proCategory)
          .toList();
    }
     emit(DashinitsuccessState(productlength: productlength.toString(),
     userlength: userlength.toString()));

    }
   
  
  }


