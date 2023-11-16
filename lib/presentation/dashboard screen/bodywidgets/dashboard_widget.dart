import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/add_product.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';
import 'package:hale_backend/presentation/product_detail%20screen/bloc/product_detail_bloc.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
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
                  const Dashcard(
                    heading: 'Orders',
                    count: '30',
                    icon: Icons.airport_shuttle_outlined,
                  )
                ],
              ),
              Container(width: screenwidth*0.6,
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

class Loadigwidget extends StatelessWidget {
  const Loadigwidget({
    super.key,
    required this.screenwidth,
    required this.screenheight,
  });

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: screenwidth,
    height: screenheight*0.8,
    child: const Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularProgressIndicator(),
        Text('Loading data')
      ],
    ),),);
  }
}

class Subdashcard extends StatelessWidget {
  final String heading;
  final String count;
  final Color headcolor;
  final Color containercolor;
  const Subdashcard(
      {super.key,
      required this.heading,
      required this.count,
      required this.headcolor,
      required this.containercolor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.black),
            color: containercolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              style: detailfont(15, headcolor, FontWeight.bold),
            ),
            Text(
              count,
              style: detailfont(15, Colors.white, FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class Dashcard extends StatelessWidget {
  final String heading;
  final IconData icon;
  final String count;
  const Dashcard({
    required this.heading,
    required this.count,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      elevation: 10,
      shadowColor: pinkcolor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: pinkcolor),
          color: Colors.white,
        ),
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 40,
              weight: .5,
            ),
            Text(
              heading,
              style: detailfont(20, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              count,
              style: detailfont(25, Colors.red, FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
