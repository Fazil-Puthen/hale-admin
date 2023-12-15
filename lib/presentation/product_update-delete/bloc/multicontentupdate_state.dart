part of 'multicontentupdate_bloc.dart';

@immutable
sealed class MulticontentupdateState {}

final class MulticontentupdateInitial extends MulticontentupdateState {}

class ImagefethsuccessState extends MulticontentupdateState{
  final List imagelist;
  ImagefethsuccessState({required this.imagelist});
}

class Addimageloadingstate extends MulticontentupdateState{}
