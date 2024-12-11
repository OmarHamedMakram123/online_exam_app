part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMassage;

  RegisterErrorState({required this.errorMassage});
}



class NavigateToMainViewState extends RegisterState {}

class NavigateToLoginState extends RegisterState {}