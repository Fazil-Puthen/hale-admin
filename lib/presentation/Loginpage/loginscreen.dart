import 'package:flutter/material.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/dashboard%20screen/dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key,});

  final nameController = TextEditingController();
  final passwordcontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 200,
            shadowColor: Colors.pink,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              width: screenWidth<600?400:screenWidth*0.4,
              height: screenHeight*0.5,
              child: screenHeight<550?
              Center(child: Text('Maximize the screen to login',style: detailfont(15,Colors.red,FontWeight.w300),),):
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SizedBox(
                     child:
                     Image.asset(
                       hale,
                       scale: 5,
                     ),
                   ),
                   const SizedBox(height: 10), // Responsive spacing
                   Form(
                    key: formkey,
                     child: Column(
                       children: [
                         LoginTextField(
                          validator: (value) {
                            if(value==null||value.isEmpty){
                              return 'Please enter the username';
                            }
                            else if(value!='halefashion'){
                              return 'Not a valid username';
                            }
                            else {
                              return null;
                            }
                          },
                           nameController: nameController,
                           icon: Icons.person,
                         ),
                         const SizedBox(height: 10), // Responsive spacing
                         LoginTextField(
                           validator: (value) {
                            if(value==null||value.isEmpty){
                              return 'Please enter the username';
                            }
                            else if(value!='hale123'){
                              return 'Not a valid password';
                            }
                            else {
                              return null;
                            }
                          },
                           nameController: passwordcontroller,
                           icon: Icons.password,
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 20), // Responsive spacing
                   InkWell(
                    onTap: () {
                      if(formkey.currentState!.validate()){
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (ctx)=>const Dashboard()),
                         (route) => false);
                      }
                    },
                     child: Container(
                       width: screenWidth * 0.1,
                       height: screenHeight * 0.05,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color: pinkcolor,
                       ),
                       child:const  Center(child: Text('Login')),
                     ),
                   ),
                 ],
               ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController nameController;

  const LoginTextField({
    Key? key,
    required this.validator,
    required this.nameController,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: TextFormField(
        validator: validator,
        controller: nameController,
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(vertical: 10,horizontal: 5) ,
          border: const OutlineInputBorder(),
          icon: Icon(icon),
          iconColor: Colors.blue,
        ),
        textInputAction: TextInputAction.next,
        magnifierConfiguration: TextMagnifier.adaptiveMagnifierConfiguration,
      ),
    );
  }
}
