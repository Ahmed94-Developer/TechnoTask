import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/profile/data/profile_remote_data_source_impl.dart';
import 'package:task/features/profile/domain/entities/profile_response.dart';
import 'package:task/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async{
    try{
      final response = await profileRemoteDataSource.getProfile();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedAppException catch(e){
      return left(ServerFailure(message: e.toString()));
    }
  }

}