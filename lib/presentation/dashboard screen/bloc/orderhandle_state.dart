part of 'orderhandle_bloc.dart';

@immutable
sealed class OrderhandleState {}

final class OrderhandleInitial extends OrderhandleState {}

class Orderfetchsuccessstate extends OrderhandleState{
  final List<Ordermodel> orderlist;
  Orderfetchsuccessstate({
    required this.orderlist
  });
}

class OrderloadingState extends OrderhandleState{}

class OrderemptyState extends OrderhandleState{}
