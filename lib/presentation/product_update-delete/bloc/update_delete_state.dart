part of 'update_delete_bloc.dart';

@immutable
sealed class UpdateDeleteState {}

final class UpdateDeleteInitial extends UpdateDeleteState {}

class ToupdateState extends UpdateDeleteState{
  final String name;
  final String brand;
  final String description;
  final String price;
  ToupdateState({
    required this.name,
    required this.brand,
    required this.description,
    required this.price
  });
}
