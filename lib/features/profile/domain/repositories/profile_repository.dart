import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/profile/domain/entities/profile_response.dart';

abstract class ProfileRepository{
  Future<Either<Failure,ProfileResponse>>getProfile();
}