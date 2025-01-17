import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/local/auth_local_data_source.dart';
import 'package:task/features/login/data/login_remote_data_source_impl.dart';
import 'package:task/features/login/domain/entities/login_params.dart';
import 'package:task/features/login/domain/entities/login_response.dart';
import 'package:task/features/login/domain/repositories/login_repositories.dart';

class LoginRepositoryImpl implements LoginRepositories{
  final LoginRemoteDataSource loginRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  LoginRepositoryImpl(this.loginRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, LoginResponse>> setLogin({required LoginParams params}) async{
    try{
      final response = await loginRemoteDataSource.setLogin(params: params);
      await authLocalDataSource.cacheUserAccessToken(token: response.data!.token!);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on NotFoundException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

}