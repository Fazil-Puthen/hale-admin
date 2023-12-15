import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/presentation/blocproviderfile.dart';
import 'package:hale_backend/presentation/dashboard%20screen/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const  FirebaseOptions(
          apiKey: "AIzaSyDE87ILs-ptG0Ij4T9-ydDww0sTBqF-L8A",
          appId: "1:737008980753:web:c714de1918d674b7f6f2b0",
          messagingSenderId:  "737008980753",
          projectId: "hale-54ebc"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:getAppProviders(),
      child: MaterialApp(
        title: 'Hale-Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const Dashboard(),
      ),
    );
  }
}
