abstract class SignInState {}

//a classe SignInLoadingState está herdando de SignInSate

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}
