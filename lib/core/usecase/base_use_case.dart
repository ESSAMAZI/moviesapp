import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<T> {
  //Tالبيانات التي نريدها ان ترجع لنا
  //UseCase نكتب الاشياء المشتركه بين كل
  Future<Either<Failure, T>> call();
}
