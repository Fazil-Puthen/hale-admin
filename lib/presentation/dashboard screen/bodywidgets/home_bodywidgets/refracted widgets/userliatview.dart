import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';

class Userlistrow extends StatelessWidget {
  final AsyncSnapshot  userdata;
  const Userlistrow({
    super.key,
    required this.userdata
  });

  @override
  Widget build(BuildContext context) {
    return
    //  ListView.separated(
    //   itemBuilder: (context, index) {
    //    Map<String, dynamic> value = userdata.data.docs[index].data() as Map<String, dynamic>;
    //     return Row(mainAxisAlignment: MainAxisAlignment.start,
    //    children: [
    //    Text('${(index+1).toString()} .',style: detailfont(15,Colors.white,FontWeight.w500),),
    //    wbox,
    //    Text(value['Name'],style: detailfont(15,Colors.white,FontWeight.w300,),textAlign: TextAlign.start,),
    //    wbox,
    //    Text(value['Mail'],style: detailfont(15,Colors.white,FontWeight.normal),),
    //    ],);
    // },
    // separatorBuilder: (context, index) => const SizedBox(height: 5,),
    // itemCount:userdata.data.docs.length ,
     
    // );
    Table(
      border: TableBorder.all(color: Colors.white,),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
       const  TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          children: [
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:EdgeInsets.all(8),
            child:Text('Sl No',style:TextStyle(color: Colors.red),))),
             TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:EdgeInsets.all(8),
            child:Text('Name',style:TextStyle(color: Colors.red)))),
             TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:EdgeInsets.all(8),
            child:Text('Email',style:TextStyle(color: Colors.red))))
          ]
        ),
        ...List.generate(userdata.data.docs.length,
         (index) {
          Map<String, dynamic> value = userdata.data.docs[index].data() as Map<String, dynamic>;
          return TableRow(
          children: [
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:const EdgeInsets.all(8),
            child:Text('${(index+1).toString()} ',style: detailfont(15,Colors.black,FontWeight.w500),))),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:const EdgeInsets.all(8),
            child:Text(value['Name'],style: detailfont(15,Colors.black,FontWeight.w300,)))),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(padding:const EdgeInsets.all(8),
            child:Text(value['Mail'],style: detailfont(15,Colors.black,FontWeight.normal)))),
           
          ]
         );})
      ],
    );

  }
}