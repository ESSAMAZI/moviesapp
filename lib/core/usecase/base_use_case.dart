import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  //Tالبيانات التي نريدها ان ترجع لنا
  //UseCase نكتب الاشياء المشتركه بين كل
  Future<Either<Failure, T>> call(Parameters parameters);
  //Parameters اي اسم يدل
  //اي عنصر يريد idاذا كان نريد ان نرسل  بيانات  مثل  Parameters
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
