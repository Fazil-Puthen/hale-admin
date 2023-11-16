part of 'addproduct_bloc.dart';

@immutable
sealed class AddproductEvent {}

class PickImageevent extends AddproductEvent{}

class AddProductdtoFirestore extends AddproductEvent{
   
   final String name;
   final String brand;
   final String description;
   final int price;
   final String category;
   final int quantitiy;

  AddProductdtoFirestore({
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.category,
    required this.quantitiy,
  });
}

 class  EditSelectedimageevent extends AddproductEvent{}

 class ImageDeleteEvent extends AddproductEvent{
  final int index;
  ImageDeleteEvent({required this.index});
 }

 class Onbuttonpressedevent extends AddproductEvent{
  final int index;
  Onbuttonpressedevent({required this.index});
 }
