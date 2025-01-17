part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

class ReviewsLoadingState extends SettingsState {}

class ReviewsErrorState extends SettingsState {
  final String message;

  ReviewsErrorState({required this.message});
}

class ReviewsSuccessState extends SettingsState {
  final ReviewsResponse response;

  ReviewsSuccessState({required this.response});
}