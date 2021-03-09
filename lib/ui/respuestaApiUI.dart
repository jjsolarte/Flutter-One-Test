import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/bloc/respuestaApi/respuesta_api_bloc.dart';
import 'package:flutter_one/model/city.dart';

class RespuestaApiUi extends StatefulWidget {
  @override
  _RespuestaApiUiState createState() => _RespuestaApiUiState();
}

class _RespuestaApiUiState extends State<RespuestaApiUi> {

  RespuestaApiBloc apiBloc;
  City city = City();
  List<City> listCity = List();

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
      body: BlocListener<RespuestaApiBloc, RespuestaApiState>(
        listener: (context, state){
          if(state is ResApiSuccessGetCityByNameState){
            print(state.props.first);
            listCity = state.props.first;
          }
          if(state is ResApiFailureGetCityByNameState){
            print(state.props.first);
          }
        },
        child: BlocBuilder<RespuestaApiBloc, RespuestaApiState>(
          builder: (context, state){
            return Center(
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
                    child: BlocBuilder<RespuestaApiBloc, RespuestaApiState>(
                      builder: (context, state){
                        if(state is ResApiLoadingState)
                          return CircularProgressIndicator();
                        else if(state is ResApiSuccessGetCityByNameState) {
                          listCity = state.props.first;
                          city = listCity.first;
                          return Center(
                            child: city.title != null ? Text(city.title) : Text(
                                'city'),
                          );
                        }
                        else
                          return Column(
                            children: [
                              Container(
                                  width: size.width*0.8,
                                  color: Colors.blueAccent,
                                  child: Center(child: Text('Enviar'))),
                              // city.title == null ?
                              // Text(city.title) : null,
                            ],
                          );
                      },
                    )
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
