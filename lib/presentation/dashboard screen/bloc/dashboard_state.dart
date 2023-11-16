part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

final class DashboardInitial extends DashboardState {}

class Homeboardstate extends DashboardState{}

class Productstate extends DashboardState{}

class Userstate extends DashboardState{}

class Messagestate extends DashboardState{}

class DashinitsuccessState extends DashboardState{
  final String productlength;
  final String userlength;
  DashinitsuccessState({
    required this.productlength,
    required this.userlength});
}

class Loadingstate extends DashboardState{}

