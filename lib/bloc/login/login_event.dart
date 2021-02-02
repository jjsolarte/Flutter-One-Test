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
