import 'package:dio/dio.dart';

abstract class Api {
  final dio = Dio();

  //? GET WEATHER BY LONGITUDE AND LATITUDE
  Future<dynamic> getWeatherByCoordinates(double lat, double lon);

  //? GET WEATHER BY CITY
  Future<dynamic> getWeatherByCity(String city);
}
