part of 'addproduct_bloc.dart';

@immutable
sealed class AddproductState {
  get pickedimages => null;
}

final class AddproductInitial extends AddproductState {}

class Gallerypicked extends AddproductState{
  final List? pickedimages;
  Gallerypicked( [this.pickedimages]);
  
}

class Firestoresavedstate extends AddproductState{}
