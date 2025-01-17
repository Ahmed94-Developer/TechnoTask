import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/login/domain/entities/login_response.dart';

import '../entities/login_params.dart';

abstract class LoginRepositories{
  Future<Either<Failure,LoginResponse>>setLogin({required LoginParams params});
}