part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class DetailFetchEvent extends ProductDetailEvent
{
  final int index;
  DetailFetchEvent({required this.index});
}
