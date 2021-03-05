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

class LoginSuccessRegisterState extends LoginState{
  final User user;

  LoginSuccessRegisterState({@required this.user});

  @override
  List<Object> get props => [user];
}

class LoginSuccessRecoveryPasswordState extends LoginState{
  final String msg;
  LoginSuccessRecoveryPasswordState({@required this.msg});
  @override
  List<Object> get props => [msg];
}

class LoginFailureRecoveryPasswordState extends LoginState{
  final String msg;
  LoginFailureRecoveryPasswordState({@required this.msg});
  @override
  List<Object> get props => [msg];
}