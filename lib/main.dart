import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/presentation/add_product%20screen/add_product.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/dashboard.dart';
import 'package:hale_backend/presentation/product_detail%20screen/bloc/product_detail_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/update_delete_bloc.dart';

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
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider(
          create: (context) => AddproductBloc(),
        ),
          BlocProvider(
          create: (context) => ProductDetailBloc(),
        ),
          BlocProvider(
          create: (context) => UpdateDeleteBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home:Dashboard(),
      ),
    );
  }
}
