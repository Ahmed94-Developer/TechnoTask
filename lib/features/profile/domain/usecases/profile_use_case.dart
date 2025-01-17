import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/profile/domain/entities/profile_response.dart';
import 'package:task/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCase extends UseCase<ProfileResponse,NoParams>{
  final ProfileRepository profileRepository;

  ProfileUseCase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileResponse>> call(NoParams params) async{
    return await profileRepository.getProfile();
  }

}