import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactivehub/models/product_model.dart';
import 'package:reactivehub/repository/product_repo.dart';

part 'view_data_event.dart';
part 'view_data_state.dart';

class ViewDataBloc extends Bloc<ViewDataEvent, ViewDataState> {
  final ProductRepo productRepo = ProductRepo();
  List<ProductModel> _allProducts = [];

  ViewDataBloc() : super(LoadingData()) {
    on<GetDataEvent>((event, emit) async {
      emit(LoadingData()); 
      try {
        final products = await productRepo.getProducts();

        _allProducts = products;

        emit(LoadedData(_allProducts));
      } catch (e) {
        emit(ErorrData(e.toString()));
      }
    });

    on<SearchedEvent>((event, emit) {
      if (event.query.isEmpty) {
        emit(LoadedData(_allProducts));
      } else {
        final filteredList = _allProducts
            .where(
              (product) => product.title.toLowerCase().contains(
                event.query.toLowerCase(),
              ),
            )
            .toList();
        emit(LoadedData(filteredList));
      }
    });
  }
}
