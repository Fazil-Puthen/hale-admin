part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

class ImageDetailstate extends ProductDetailState{
  final int index;
  ImageDetailstate({required this.index});

  
}
