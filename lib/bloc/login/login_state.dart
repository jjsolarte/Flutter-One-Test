part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState{
  final String msg;

  LoginLoadingState({this.msg});

  @override
  List<Object> get props => [msg];
}

class LoginSuccessLogInState extends LoginState{
  final bool res;

  LoginSuccessLogInState({@required this.res});

  @override
  List<Object> get props => [res];
}

class LoginFailureLogInState extends LoginState{
  final String msg;

  LoginFailureLogInState({@required this.msg});

  @override
  List<Object> get props => [msg];
}