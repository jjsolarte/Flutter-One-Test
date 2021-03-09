import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_one/model/city.dart';

class Api{

  Dio _dio = Dio();

  Future<List<City>> getCityByName(String city) async{
    try{
      //Hacemos la petición
      final url = 'https://www.metaweather.com/api/location/search/?query='+city;

      final get = await _dio.get(url);

      if(get.statusCode == 200){

        final jsonRes = get.data[0];
        final city = City.fromJson(jsonRes);
        // final res = json.decode(get.data);
        // final listCity = Cities.fromJsonList(res);
        final List<City> listCity = List();
        listCity.add(city);
        print(listCity);
        return listCity;

      }else{
        print('Esto es una exception en la petición');
        return null;
      }

    }catch (exception){
      //Si falla, respondemos aquí
      print(exception);
      return null;
    }
  }

}

class Cities {
  List<City> cities = List();
  Cities();
  Cities.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){ //int i = 0; i < = jsonList.length ; i++
      final city = City.fromJson(item);
      cities.add(city);
    }
  }
}