part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState({required this.message});
}

class ProfileSuccessState extends ProfileState {
  final ProfileResponse profileResponse;

  ProfileSuccessState({required this.profileResponse});
}
