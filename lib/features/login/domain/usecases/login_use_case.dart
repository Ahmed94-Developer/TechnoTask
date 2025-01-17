import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/login/domain/entities/login_params.dart';
import 'package:task/features/login/domain/entities/login_response.dart';
import 'package:task/features/login/domain/repositories/login_repositories.dart';

import '../../../../core/usecases/usecase.dart';

class LoginUseCase extends UseCase<LoginResponse,LoginParams>{
  final LoginRepositories loginRepositories;

  LoginUseCase(this.loginRepositories);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params) async{
    return await loginRepositories.setLogin(params: params);
  }

}