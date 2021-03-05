import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/bloc/respuestaApi/respuesta_api_bloc.dart';

class RespuestaApiUi extends StatefulWidget {
  @override
  _RespuestaApiUiState createState() => _RespuestaApiUiState();
}

class _RespuestaApiUiState extends State<RespuestaApiUi> {

  RespuestaApiBloc apiBloc;

  TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    apiBloc = BlocProvider.of<RespuestaApiBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Respuesta Api'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textController,
            ),
            FlatButton(
              onPressed: (){
                print(textController.text);
                apiBloc.add(ResApiGetCityByNameEvent(city: textController.text));
              },
              child: Container(
                  width: size.width*0.8,
                  color: Colors.blueAccent,
                  child: Center(child: Text('Enviar'))),
            )
          ],
        ),
      ),
    );
  }
}
