import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  //نجلب بيانات الافلام الصوره والرقم المخصص
  final String? backdropPath;
  final int id;

  const Recommendation({this.backdropPath, required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}
/*
[domain Layer]
1-create entities
2- create abstract class repository
3-create calss name usecase [object repository ]
[data Layer]
1-crate model
2- create abstract BaseRemoteDataSource data source and function [data model]
3-create class RemoteDataSource extends BaseRemoteDataSource function [Dio]
4-create class repository extends [domain Layer]BaseMoviesRepository.
[presentation Layer ]
1-controller create Bloc event and state[data entities ] and bloc

*/