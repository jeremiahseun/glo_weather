import 'secret.dart';

///? THE API KEY IS IN A SECRET FILE. FOR IT TO WORK, YOU WILL NEED YOUR API KEY.
///? ONCE YOU HAVE GOTTEN YOUR API KEY, YOU CAN PUT IN THIS PLACE DIRECTLY.
String apiLocationLink({required double lat, required double lon}) =>
    'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

String apiCityLink({required String city}) =>
    'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
