part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

final class DashboardInitial extends DashboardState {}

class Homeboardstate extends DashboardState{}

class Productstate extends DashboardState{}

class Userstate extends DashboardState{}

class OrdersState extends DashboardState{
  
}

class DashinitsuccessState extends DashboardState{
  final String productlength;
  final String userlength;
  final String orderlength;
  DashinitsuccessState({
    required this.productlength,
    required this.userlength,
    required this.orderlength});
}

class Loadingstate extends DashboardState{}



