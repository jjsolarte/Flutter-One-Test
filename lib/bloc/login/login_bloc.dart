import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_one/bloc/login/login_logic.dart';
import 'package:flutter_one/model/User.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;
  LoginBloc({@required this.logic}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginLogInEvent) {
      yield* logic.loginIn(email: event.email, password: event.password);
    } else if (event is LoginRegisterEvent) {
      yield* logic.loginRegister(email: event.email, password: event.password);
    }else if(event is LoginRecoveryPasswordEvent){
      yield* logic.loginRecoveryPassword(email: event.email);
    } else {
      yield LoginInitial();
    }
  }
}
