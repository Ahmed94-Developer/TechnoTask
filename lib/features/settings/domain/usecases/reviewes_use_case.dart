import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/settings/domain/entities/reviews_response.dart';
import 'package:task/features/settings/domain/repositories/settings_repository.dart';

class ReviewsUseCase extends UseCase<ReviewsResponse,NoParams>{
  final SettingsRepository settingsRepository;

  ReviewsUseCase(this.settingsRepository);

  @override
  Future<Either<Failure, ReviewsResponse>> call(NoParams params) async{
    return await settingsRepository.getReviews();
  }

}