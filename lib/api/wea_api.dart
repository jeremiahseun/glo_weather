import 'package:dio/dio.dart';
import 'package:glo_weather/api/api.dart';
import 'package:glo_weather/models/get_weather_model.dart';
import 'package:glo_weather/utils/constants.dart';

class WeaApi extends Api {
  @override
  //? GET WEATHER BY LONGITUDE AND LATITUDE
  Future<WeatherResponse?> getWeatherByCoordinates(double lat, double lon) async {
    try {
      final response = await dio.get(
       apiLocationLink(lat: lat, lon: lon),
      );
      return WeatherResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

    @override
  //? GET WEATHER BY CITY
  Future<WeatherResponse?> getWeatherByCity(String city) async {
    try {
      final response = await dio.get(
        apiCityLink(city: city),
      );
      return WeatherResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
  
}