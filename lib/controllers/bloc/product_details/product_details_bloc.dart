import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactivehub/models/product_model.dart';
import 'package:reactivehub/repository/product_repo.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsLoading()) {
    ProductRepo productRepo = ProductRepo();
    on<GetProductDetailsEvent>((event, emit) async {
      try {
        final product = await productRepo.getProductById(event.id);
        emit(ProductDetailsLoaded(product));
      } catch (e) {
        emit(ProductDetailsError(e.toString()));
      }
    });
  }
}
