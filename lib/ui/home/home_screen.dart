import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('App Ventas'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Aplicación de Ventas para la ficha 1966722'),
        ),
      ),
    );
  }
}
