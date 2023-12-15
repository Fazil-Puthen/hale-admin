import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/models/ordermodel.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/orderhandle_bloc.dart';

class Orderwidget extends StatefulWidget {
  const Orderwidget({super.key});

  @override
  State<Orderwidget> createState() => _OrderwidgetState();
}

class _OrderwidgetState extends State<Orderwidget> {

@override
  void initState() {
    context.read<OrderhandleBloc>().add(Ordersfetchevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Orders',style: detailfont(15,Colors.black, FontWeight.bold),),
              box,
              BlocBuilder<OrderhandleBloc,OrderhandleState>(
                builder: (context, state) {
                  if(state is OrderloadingState){
                    return Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: pinkcolor,),
                        box,
                        Text('Loading Orders',style: detailfont(15,Colors.black,FontWeight.w400),)

                      ],
                    ),);
                  }
                  else if(state is Orderfetchsuccessstate){
                    final List<Ordermodel> orderlist=state.orderlist;
                    if(orderlist.isNotEmpty){
                  return SizedBox(
                    width: screenwidth*0.8,
                    height: screenheight*0.8,
                    child: screenwidth<600?SizedBox(
                      width: screenwidth,
                      height: screenheight,
                      child: Center(child: Text('Maxmize tab for full view',style: detailfont(15,Colors.red,FontWeight.bold),))):
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                                width:screenwidth*0.8 ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 0.2,color: Colors.black),
                                color: Colors.white),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [Text('Usermail:-',style: detailfont(13,Colors.red,FontWeight.w300),),
                                        Text(orderlist[index].useId)],
                                      ),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Row(
                                          children: [
                                            const Text('Order Date: '),
                                            Text(orderlist[index].orderdate,style: detailfont(13, Colors.red, FontWeight.w300),),
                                          ],
                                        ),
                                        box,
                                        Row(
                                          children: [
                                            const Text('OrderId: '),
                                            Text(orderlist[index].orderId,style: detailfont(13, Colors.red, FontWeight.w300),),
                                          ],
                                        ),
                                        smallbox,
                                          Row(
                                          children: [
                                            const Text('PaymentId: '),
                                            Text(orderlist[index].paymetId,style: detailfont(13, Colors.red, FontWeight.w300),)
                                          ],
                                        ),
                                        smallbox,
                                        Row(
                                          children: [
                                            const Text('Amount paid: '),
                                            Text('₹ ${orderlist[index].orderprice.toString()}/-',style: detailfont(13, Colors.red, FontWeight.w300),)
                                          ],
                                        ),
                                        ],
                                                                           ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: SizedBox(width: screenwidth*0.4,
                                        height: screenheight*0.3,
                                        child: ListView.separated(
                                         itemBuilder:(context, itemindex) {
                                           return Container(color: Colors.grey.shade100,
                                             child: ListTile(
                                           
                                              leading: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Image.network(orderlist[index].items[itemindex]['imageurl'][0]),
                                              ),
                                              title: Text(orderlist[index].items[itemindex]['name'],style: detailfont(14,Colors.black,FontWeight.w300,)),
                                              subtitle: Text('Order quantity: ${orderlist[index].items[itemindex]['cartquantity'].toString()} nos',
                                              style: detailfont(14,Colors.red,FontWeight.w300,),),
                                              trailing: Text('Paid: ₹ ${orderlist[index].items[itemindex]['quantitypricechange'].toString()}',
                                              style: detailfont(14,Colors.red,FontWeight.w300,),),
                                             ),
                                           );
                                         }, 
                                         separatorBuilder:(context, index) => const SizedBox(height: 5,), 
                                         itemCount: orderlist[index].items.length),),
                                      ),                            
                                    ],
                                  )
                                  );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                      itemCount: orderlist.length,
                      
                      
                       
                    ),
                  );}
                  else{
                    return SizedBox(width: screenwidth,height: screenheight*0.3,
                    child:const Center(child: Text('No Orders Yet'),),);
                  }
                  }
                  else{
                    return const SizedBox();
                  }
                },
              ),
            ],
          )))
    );
  }
}