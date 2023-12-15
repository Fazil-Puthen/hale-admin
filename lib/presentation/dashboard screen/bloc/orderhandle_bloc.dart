import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale_backend/models/ordermodel.dart';
import 'package:meta/meta.dart';

part 'orderhandle_event.dart';
part 'orderhandle_state.dart';

class OrderhandleBloc extends Bloc<OrderhandleEvent, OrderhandleState> {
  OrderhandleBloc() : super(OrderhandleInitial()) {
    on<OrderhandleEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Ordersfetchevent>(orderfetchhandler);
    on<Statusupdateevent>(statusupatehandler);
  }
   final firestore=FirebaseFirestore.instance; 
   List<Ordermodel> orderlist=[];

   FutureOr<void> orderfetchhandler(Ordersfetchevent event, Emitter<OrderhandleState> emit) async{
    emit(OrderloadingState());
    orderlist.clear();
    final usercollection=firestore.collection('users');
    final ordersdocs=await usercollection.get();
    for(var documents in ordersdocs.docs){
      final docIds=documents.reference.id;
      // print('this are the docids : $docIds');
      
    final orders=await usercollection.doc(docIds).collection('orders').get();

      if(orders .docs.isNotEmpty){
      for(var orderdoc in orders.docs){
        final data=orderdoc.data();
        final orderitem=Ordermodel(
        useId: docIds,
        orderdate: data['date'],
        paymetId: data['paymentid'],
        orderId: data['orderid'], 
        items: data['items'],
        orderprice: data['totalprice'],
        status: false,
        );
        orderlist.add(orderitem);
      }
      }
      emit(Orderfetchsuccessstate(orderlist: orderlist));
    }
    
  }

  FutureOr<void> statusupatehandler(Statusupdateevent event, Emitter<OrderhandleState> emit) {
  }
}
