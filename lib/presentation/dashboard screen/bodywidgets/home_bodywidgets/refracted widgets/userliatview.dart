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
    return ListView.separated(
      itemBuilder: (context, index) {
       Map<String, dynamic> value = userdata.data.docs[index].data() as Map<String, dynamic>;
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [Text('${(index+1).toString()} .',style: detailfont(15,Colors.white,FontWeight.w500),),
       Text(value['Name'],style: detailfont(15,Colors.white,FontWeight.w300,)),
       Text(value['Mail'],style: detailfont(15,Colors.white,FontWeight.normal),),
       Icon(Icons.delete,color: Colors.red,)],);
    },
    separatorBuilder: (context, index) => const SizedBox(height: 5,),
    itemCount:userdata.data.docs.length ,
     
    );
  }
}