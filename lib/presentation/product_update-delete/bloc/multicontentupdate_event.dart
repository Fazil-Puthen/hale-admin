part of 'multicontentupdate_bloc.dart';

@immutable
sealed class MulticontentupdateEvent {}

class Fetchupdateimageevent extends MulticontentupdateEvent{
final String id;
Fetchupdateimageevent({required this.id});
}

class AddimageEvent extends MulticontentupdateEvent{
}

class DeleteimageEvent extends MulticontentupdateEvent{
  final int index;
  DeleteimageEvent({required this.index});
}

class UpdateProductimageevent extends MulticontentupdateEvent{
  final String id;
  UpdateProductimageevent({required this.id});
}