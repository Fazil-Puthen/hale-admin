part of 'update_delete_bloc.dart';

@immutable
sealed class UpdateDeleteEvent {}

class UpdateEvent extends UpdateDeleteEvent{
  final String id;
  UpdateEvent({required this.id});
}

class ToupdateEvent extends UpdateDeleteEvent{
  final String id;
  final int index;
  ToupdateEvent({required this.id,required this.index});
}

class UpdateProductevent extends UpdateDeleteEvent{
  final String id;
  final String name;
  final String brand;
  final String description;
  final int price;
  UpdateProductevent({
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.id,
  });
}

class DeleteProductevent extends UpdateDeleteEvent{
  final String id;
  DeleteProductevent({
    required this.id
  });
}
