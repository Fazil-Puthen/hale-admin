part of 'addproduct_bloc.dart';

@immutable
sealed class AddproductEvent {}

class PickImageevent extends AddproductEvent{}

class AddProductdtoFirestore extends AddproductEvent{
   
   final String name;
   final String brand;
   final String description;
   final String price;

  AddProductdtoFirestore({
    required this.name,
    required this.brand,
    required this.description,
    required this.price
  });
}
