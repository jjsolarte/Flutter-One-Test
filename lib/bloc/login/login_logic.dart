import 'package:flutter/cupertino.dart';
import 'package:flutter_one/bloc/login/login_bloc.dart';
import 'package:flutter_one/model/User.dart';

abstract class LoginLogic {
  Stream<LoginState> loginIn(
      {@required String email, @required String password});
  Stream<LoginState> loginRegister(
      {@required String email, @required String password});
  Stream<LoginState> loginRecoveryPassword({@required String email});
}

class LoginLogicInit implements LoginLogic{
  @override
  Stream<LoginState> loginIn({String email, String password}) async*{
    try{
      yield LoginLoadingState(msg: 'Validando Información');
      if (email == 'jeisonsolarte@gmail.com' &&
          password == '123456') {
        yield LoginSuccessLogInState(res: true);
      } else {
        yield LoginFailureLogInState(msg: 'Por favor verifique sus datos');
      }
    }catch (e){
      yield LoginFailureLogInState(msg: e);
    }
  }

  @override
  Stream<LoginState> loginRegister({String email, String password}) async*{
    try{
      yield LoginLoadingState(msg: 'Validando Información');
      if (email == 'jeisonsolarte@gmail.com' &&
          password == '123456') {
        yield LoginSuccessRegisterState(user: User(),);
      } else {
        yield LoginFailureLogInState(msg: 'Por favor verifique sus datos');
      }
    }catch (e){
      yield LoginFailureLogInState(msg: e);
    }
  }

  @override
  Stream<LoginState> loginRecoveryPassword({String email}) async*{
    try{
      yield LoginLoadingState(msg: 'Enviando información');
      // final bool response = await Api().recoveryPassword(email: email);
      final bool response = true;
      if(response!=null){
        if(response){
          yield LoginSuccessRecoveryPasswordState(msg: 'Verifique su correo');
        }{
          yield LoginFailureRecoveryPasswordState(msg: 'Usted no se encuentra registrado');
        }
      }else{
        yield LoginFailureRecoveryPasswordState(msg: 'Por favor intente más tarde');
      }
    }catch (e){
      yield LoginFailureRecoveryPasswordState(msg: 'Error en la conexión');
    }
  }

}