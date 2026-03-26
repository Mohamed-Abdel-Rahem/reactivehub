// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  UserModel({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
