import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ProductDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DetailFetchEvent>(deteilfetchhandler);
  }

  FutureOr<void> deteilfetchhandler(DetailFetchEvent event, Emitter<ProductDetailState> emit) {
    
  }
}
