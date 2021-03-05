import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/bloc/login/login_bloc.dart';
import 'package:flutter_one/ui/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc;

  TextEditingController emailConroller;
  TextEditingController passwordConroller;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    emailConroller = TextEditingController();
    passwordConroller = TextEditingController();
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Image Background
            Container(
              height: size.height,
              width: size.width,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/foto1.png',
                fit: BoxFit.cover,
                height: size.height * 0.4,
              ),
            ),

            //Cards
            Positioned(
              top: size.height * 0.35,
              child: Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            'App Ventas',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(Icons.card_giftcard_rounded),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            'Inicio de Sesión \n',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueAccent),
                              ),
                              TextField(
                                onTap: () {},
                                keyboardType: TextInputType.text,
                                controller: emailConroller,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueAccent),
                              ),
                              TextField(
                                onTap: () {},
                                keyboardType: TextInputType.text,
                                controller: passwordConroller,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              BlocListener<LoginBloc, LoginState>(
                                listener: (conxtext, state) {
                                  if (state is LoginInitial) {}
                                  if (state is LoginLoadingState) {}
                                  if (state is LoginSuccessLogInState) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => HomeScreen()));
                                  }
                                  if (state is LoginFailureLogInState) {
                                    mostrarAlerta(context, state);
                                  }
                                  if(state is LoginSuccessRecoveryPasswordState){
                                    print('verificar el correo');
                                  }
                                },
                                child: BlocBuilder<LoginBloc, LoginState>(
                                    builder: (conxtext, state) {
                                  if (state is LoginLoadingState) {
                                    return CircularProgressIndicator();
                                  } else {
                                    return FlatButton(
                                        color: Colors.grey.withOpacity(0.3),
                                        onPressed: () {
                                          _doLogin();
                                        },
                                        child: Text(
                                          'Ingresar',
                                          style: TextStyle(fontSize: 18),
                                        ));
                                  }
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            '¿Aún no tienes cuenta? \n',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  color: Colors.grey.withOpacity(0.3),
                                  onPressed: () {
                                    _doRegister();
                                  },
                                  child: Text(
                                    'Registarse',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                FlatButton(
                                  color: Colors.grey.withOpacity(0.3),
                                  onPressed: () {
                                    if(emailConroller.text.length>1){
                                      loginBloc.add(LoginRecoveryPasswordEvent(email: emailConroller.text));
                                    }else{
                                      print('por favor escriba un email');
                                    }
                                  },
                                  child: Text(
                                    'Recuperar Contraseña',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
                top: size.height * 0.30,
                right: size.width * 0.1,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/logo/bruja.png'),
                ))
          ],
        ),
      ),
    );
  }

  void _doLogin() {
    loginBloc.add(
      LoginLogInEvent(
        email: emailConroller.value.text,
        password: passwordConroller.value.text,
      ),
    );
  }

  void _doRegister() {
    loginBloc.add(LoginRegisterEvent(
        email: emailConroller.value.text,
        password: passwordConroller.value.text));
  }

  void mostrarAlerta(BuildContext context, LoginState state) async {
    bool shouldUpdate = await showDialog(
      context: this.context,
      child: new AlertDialog(
        content: new FlatButton(
          child: new Text(state.props.first),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
    );
  }
}
