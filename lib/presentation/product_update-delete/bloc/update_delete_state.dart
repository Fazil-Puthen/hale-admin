part of 'update_delete_bloc.dart';

@immutable
sealed class UpdateDeleteState {}

final class UpdateDeleteInitial extends UpdateDeleteState {}

class ToupdateState extends UpdateDeleteState{
  // final List images;
  final String name;
  final String brand;
  final String description;
  final int price;
  ToupdateState({
    // required this.images,
    required this.name,
    required this.brand,
    required this.description,
    required this.price
  });
}

class Fireimagedeletestate extends UpdateDeleteState{
  final List image;
  Fireimagedeletestate({required this.image});
}
