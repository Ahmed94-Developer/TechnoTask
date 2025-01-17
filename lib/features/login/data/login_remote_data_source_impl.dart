import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/utils/api_bas_helper.dart';
import 'package:task/features/login/domain/entities/login_response.dart';

import '../domain/entities/login_params.dart';

const loginApi = "/login";
abstract class LoginRemoteDataSource {
  Future<LoginResponse>setLogin({required LoginParams params});
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiBaseHelper helper;

  LoginRemoteDataSourceImpl(this.helper);

  @override
  Future<LoginResponse> setLogin({required LoginParams params}) async{
    try{
      final response = await helper.post(url: loginApi, body: params.toMap());
      return LoginResponse.fromJson(response);
    }on ServerException catch(e){
      throw ServerException(message: e.message);
    }on UnprocessableContentException catch(e){
      throw UnprocessableContentException(message: e.message);
    }on UnAuthorizedException catch(e){
      throw UnAuthorizedException(message: e.message);
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

}