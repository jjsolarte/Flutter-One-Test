part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginLogInEvent extends LoginEvent {
  final String email;
  final String password;

  LoginLogInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginRegisterEvent extends LoginEvent{
  final String email, password;

  LoginRegisterEvent({@required this.email,@required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginRecoveryPasswordEvent extends LoginEvent{
  final String email;

  LoginRecoveryPasswordEvent({@required this.email});

  @override
  List<Object> get props => [email];

}
