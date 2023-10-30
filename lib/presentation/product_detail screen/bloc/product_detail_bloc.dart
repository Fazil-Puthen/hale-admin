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
    on<ImagePressedevent>(imagedetailhandler);
  }

  FutureOr<void> deteilfetchhandler(DetailFetchEvent event, Emitter<ProductDetailState> emit) {
    
  }

  FutureOr<void> imagedetailhandler(ImagePressedevent event, Emitter<ProductDetailState> emit) {
    emit(ImageDetailstate(index:event.index));
  }
}
