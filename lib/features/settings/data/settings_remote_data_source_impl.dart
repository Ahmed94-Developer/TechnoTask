import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/utils/api_bas_helper.dart';
import 'package:task/features/settings/domain/entities/reviews_response.dart';

const reviewsApi = "/reviews/representative-reviews";
abstract class SettingsRemoteDataSource {
  Future<ReviewsResponse>getReviews();
}
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiBaseHelper helper;

  SettingsRemoteDataSourceImpl(this.helper);

  @override
  Future<ReviewsResponse> getReviews() async{
    try{
      final response = await helper.get(url: reviewsApi);
      return ReviewsResponse.fromJson(response);
    }on ServerException catch(e){
      throw ServerException(message: e.message);
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }on UnAuthorizedException catch(e){
      throw UnAuthorizedException(message: e.message);
    }
  }

}