part of 'view_data_bloc.dart';

sealed class ViewDataEvent extends Equatable {
  const ViewDataEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends ViewDataEvent {}

class SearchedEvent extends ViewDataEvent {
  final String query;
  const SearchedEvent(this.query);
  @override
  List<Object> get props => [query];
}


