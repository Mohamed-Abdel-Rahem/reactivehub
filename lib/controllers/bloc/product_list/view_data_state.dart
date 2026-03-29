part of 'view_data_bloc.dart';

sealed class ViewDataState extends Equatable {
  const ViewDataState();

  @override
  List<Object> get props => [];
}

final class LoadingData extends ViewDataState {
  const LoadingData();
  @override
  List<Object> get props => [];
}

final class LoadedData extends ViewDataState {
  final List<ProductModel> products;
  const LoadedData(this.products);

  @override
  List<Object> get props => [products];
}

final class ErorrData extends ViewDataState {
  final String errorMessage;
  const ErorrData(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
