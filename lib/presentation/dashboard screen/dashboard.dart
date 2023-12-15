import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/dashboard_widget.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/orders_widget.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/product_widget.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bodywidgets/user_widget.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/Hale.png',
        scale: 5,),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenwidth<750?screenwidth:screenwidth*0.5,
            height: screenheight*0.1,
           decoration: BoxDecoration(
            borderRadius:const  BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
            color: pinkcolor
           ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Dashboardbutton(icon:Icons.dashboard_outlined,text:'Dashboard',index: 1,),
               Dashboardbutton(icon: Icons.card_travel_rounded, text: 'Products',index: 2,),
               Dashboardbutton(icon: Icons.supervised_user_circle_outlined, text: 'Users',index: 3,),
               Dashboardbutton(icon: Icons.flight_takeoff_rounded, text:'Orders',index: 4,)
              ],
            ),
            ),
         BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if(state is OrdersState){
              return const Orderwidget();
            }
            else if(state is Productstate){
              return const Productwidget();
            }
            else if(state is Userstate){
              return const  Userwidget();
            }
            else{
              return const Dashwidget();
            }
          },
         )
            
          ],
          
        ),
      )
    );
  }
}

class Dashboardbutton extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
 
  const Dashboardbutton({
    required this.icon,
    required this.text,
    required this.index,
  
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:(){ context.read<DashboardBloc>().add(WidgetchangeEvent(index: index));},
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [Icon(icon),Text(text,style: detailfont(10,Colors.black, FontWeight.w300),)],
        ),
    );
  }
}