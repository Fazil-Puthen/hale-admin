import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/refracted%20widget/dashcard.dart';
import 'package:hale_backend/presentation/dashboard%20screen/refracted%20widget/loadingwidgst.dart';


class Dashwidget extends StatefulWidget {
  const Dashwidget({super.key});

  @override
  State<Dashwidget> createState() => _DashwidgetState();
}

class _DashwidgetState extends State<Dashwidget> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(Dashboardinitevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return  BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is Loadingstate){
          return  Loadigwidget(screenwidth: screenwidth, screenheight: screenheight);
        }
        if(state is DashinitsuccessState){
        return Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dashcard(
                    heading: 'Products Added',
                    count: state.productlength,
                    icon: Icons.card_travel_outlined,
                  ),
                  //  const SizedBox(width: 20,),
                  Dashcard(
                    heading: 'Users',
                    count: state.userlength,
                    icon: Icons.man,
                  ),
                   Dashcard(
                    heading: 'Orders',
                    count: state.orderlength,
                    icon: Icons.airport_shuttle_outlined,
                  )
                ],
              ),
              SizedBox(width: screenwidth*0.6,
              height: screenheight*0.4,
              
              )
            ],
          ),
        );}
        else{return const Center(child: Text('No network'),);}
      },
    );
  }
}






