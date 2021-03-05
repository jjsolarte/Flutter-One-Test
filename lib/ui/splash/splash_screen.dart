import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_one/ui/login/login_screen.dart';
import 'package:flutter_one/ui/respuestaApiUI.dart';
import 'package:flutter_one/ui/voice/voice_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Colors.white;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => RespuestaApiUi()));
    });
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JEISON SOLARTE'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
        body: Container(
            color: Color(0xFF673AB7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/logo/bruja.png',
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _color = changeColor(_color);
                              });
                            },
                            child: Text(
                              'Flutter One',
                              style: TextStyle(
                                  color: _color,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          // FlatButton(
                          //   onPressed: () {
                          //     _color = changeColor(_color);
                          //     setState(() { });
                          //   },
                          //   child: FadeInImage.assetNetwork(
                          //       height: 50.0,
                          //       placeholder: 'assets/images/foto1.png',
                          //       image:
                          //           'https://m.eltiempo.com/files/image_640_428/uploads/2020/10/17/5f8ae5d9e4257.jpeg'),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'ADSI 1966722',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

Color changeColor(Color color) {
  if (color == Colors.white) {
    return color = Colors.blueAccent;
  } else {
    return color = Colors.white;
  }

}
