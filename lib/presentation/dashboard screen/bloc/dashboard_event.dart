part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class WidgetchangeEvent extends DashboardEvent{
  final int index;
  WidgetchangeEvent({required this.index});
}
