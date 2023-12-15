import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/dashboard_bloc.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';
import 'package:hale_backend/presentation/product_detail%20screen/bloc/product_detail_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/multicontentupdate_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/update_delete_bloc.dart';
import 'package:hale_backend/presentation/dashboard%20screen/bloc/orderhandle_bloc.dart';

List<BlocProvider> getAppProviders() {
  return [
    BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(),
    ),
    BlocProvider<AddproductBloc>(
      create: (context) => AddproductBloc(),
    ),
    BlocProvider<ProductDetailBloc>(
      create: (context) => ProductDetailBloc(),
    ),
    BlocProvider<UpdateDeleteBloc>(
      create: (context) => UpdateDeleteBloc(),
    ),
    BlocProvider<MulticontentupdateBloc>(
      create: (context) => MulticontentupdateBloc(),
    ),
    BlocProvider<OrderhandleBloc>(
      create: (context) => OrderhandleBloc(),
    ),
  ];
}
