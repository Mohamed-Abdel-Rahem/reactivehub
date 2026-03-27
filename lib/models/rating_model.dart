import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double rate;
  final int count;

  const Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json['rate'] as num).toDouble(), count: json['count']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}
