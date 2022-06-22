import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glo_weather/api/wea_api.dart';

import 'home.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              const Text('Search the cities weather',
                  style: TextStyle(fontSize: 30)),
              const Gap(40),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: 'Enter a city',
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (cityText) async {
                  await getWeatherByCity(cityText, context);
                },
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
              ),
            ]),
          ),
        )),
      ),
    );
  }

  Future getWeatherByCity(String cityName, BuildContext context) async {
    try {
      final result = await WeaApi().getWeatherByCity(cityName);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage(weather: result!)));
    } catch (e) {
      rethrow;
    }
  }
}
