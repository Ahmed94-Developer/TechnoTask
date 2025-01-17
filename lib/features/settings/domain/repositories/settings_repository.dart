import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/settings/domain/entities/reviews_response.dart';

abstract class SettingsRepository {
  Future<Either<Failure,ReviewsResponse>>getReviews();
}