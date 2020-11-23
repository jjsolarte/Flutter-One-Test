import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/ui/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
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
      body: Stack(
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
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FlatButton(
                                color: Colors.grey.withOpacity(0.3),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
                                },
                                child: Text(
                                  'Ingresar',
                                  style: TextStyle(fontSize: 18),
                                ))
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
                                onPressed: () {},
                                child: Text(
                                  'Registarse',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              FlatButton(
                                color: Colors.grey.withOpacity(0.3),
                                onPressed: () {},
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
    );
  }
}
