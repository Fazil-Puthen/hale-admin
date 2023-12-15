part of 'orderhandle_bloc.dart';

@immutable
sealed class OrderhandleEvent {}

class Ordersfetchevent extends OrderhandleEvent{}

class Statusupdateevent extends OrderhandleEvent{}