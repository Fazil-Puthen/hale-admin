import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
    });
    on<WidgetchangeEvent>(changeevnthandler);
  }

  FutureOr<void> changeevnthandler(WidgetchangeEvent event, Emitter<DashboardState> emit) {
    if(event.index==1){
      emit(Homeboardstate());
    }
    else if(event.index==2){
      emit(Productstate());
    }
    else if(event.index==3){
      emit(Userstate());
    }
    else{
      emit(Messagestate());
    }
  }
}
