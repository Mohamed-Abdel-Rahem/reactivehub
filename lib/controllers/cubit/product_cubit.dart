// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:reactivehub/models/product_model.dart';
// import 'package:reactivehub/repository/product_repo.dart';

// part 'product_state.dart';

// class ProductCubit extends Cubit<ProductState> {
//   ProductCubit() : super(ProductLoading());
//   ProductRepo productRepo = ProductRepo();
//   getProducts() async {
//     try {
//       final products = await productRepo.getProducts();
//       emit(ProductLoaded(products));
//     } catch (e) {
//       print('error occured : ${e.toString()}');
//       emit(ProductError(e.toString()));
//     }
//   }
// }
