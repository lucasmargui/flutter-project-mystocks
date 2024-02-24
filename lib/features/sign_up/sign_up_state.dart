abstract class SignUpState {}

//a classe SignUpLoadingState está herdando de SignUpSate

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}
