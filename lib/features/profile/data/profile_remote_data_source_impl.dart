import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/utils/api_bas_helper.dart';
import 'package:task/features/profile/domain/entities/profile_response.dart';

const profileApi = "/getUserData";
abstract class ProfileRemoteDataSource {
  Future<ProfileResponse>getProfile();
}
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiBaseHelper helper;


  ProfileRemoteDataSourceImpl(this.helper);

  @override
  Future<ProfileResponse> getProfile() async{
    try{
      final response = await helper.get(url: profileApi,);
      return ProfileResponse.fromJson(response);
    }on ServerException catch(e){
      throw ServerException(message: e.message);
    }
  }

}