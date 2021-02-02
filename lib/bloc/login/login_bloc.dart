import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is LoginLogInEvent){
      yield LoginLoadingState(msg: 'Cargando');
      print('Cargando');
      if(event.email == 'jeisonsolarte@gmail.com' && event.password == '123456'){
        yield LoginSuccessLogInState(res: true);
        print('ok');
      }else{
        yield LoginFailureLogInState(msg: 'Por favor verifique sus datos');
        print('no');
      }
    }else{
      yield LoginInitial();
    }
  }
}
