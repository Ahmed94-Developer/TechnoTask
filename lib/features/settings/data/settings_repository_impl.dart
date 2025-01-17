import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/settings/data/settings_remote_data_source_impl.dart';
import 'package:task/features/settings/domain/entities/reviews_response.dart';
import 'package:task/features/settings/domain/repositories/settings_repository.dart';

import '../../../core/constants/errors/exceptions.dart';

class SettingsRepositoryImpl implements SettingsRepository{
  final SettingsRemoteDataSource settingsRemoteDataSource;

  SettingsRepositoryImpl(this.settingsRemoteDataSource);

  @override
  Future<Either<Failure, ReviewsResponse>> getReviews() async{
   try{
     final response = await settingsRemoteDataSource.getReviews();
     return Right(response);
   }on ServerException catch(e){
     return left(ServerFailure(message: e.message));
   }on NotFoundException catch(e){
     return left(ServerFailure(message: e.message));
   }on UnAuthorizedException catch(e){
     return left(ServerFailure(message: e.message));
   }
  }

}