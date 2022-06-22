import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glo_weather/models/get_weather_model.dart';

class HomePage extends StatelessWidget {
  final WeatherResponse weather;
  const HomePage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTemp(weather.main?.temp ?? 0.0),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: colorTemp(weather.main?.temp ?? 0.0),
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                const Gap(40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "${weather.weather?.first.description?.toUpperCase()}",
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${weather.main?.temp}" "°C",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                const Gap(50),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${weather.name}, ${weather.sys?.country}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ]),
            ),
            const Gap(50),
            const Text("Table", style: TextStyle(fontSize: 30)),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text('Pressure')),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text('Humidity')),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text('Temperature')),
                  ]),
                  TableRow(children: [
                    Container(
                        color: colorPressure(weather.main?.pressure ?? 0.0),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Text('${weather.main?.pressure}')),
                    Container(
                        color: colorHumidity(weather.main?.humidity ?? 0.0),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Text('${weather.main?.humidity}')),
                    Container(
                        color: colorTemp(weather.main?.temp ?? 0.0),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Text('${weather.main?.temp}')),
                  ]),
                ],
              ),
            ),
            const Gap(50),
          ],
        )),
      ),
    );
  }

  Color colorHumidity(num humidity) {
    if (humidity > 50 && humidity < 60) {
      return Colors.green;
    } else if (humidity > 60) {
      return Colors.orange;
    } else {
      return Colors.white;
    }
  }

  Color colorPressure(num pressure) {
    if (pressure > 1000 && pressure < 1200) {
      return Colors.green;
    } else if (pressure > 1200) {
      return Colors.orange;
    } else {
      return Colors.white;
    }
  }

  Color colorTemp(num temp) {
    if (temp > 20 && temp < 30) {
      return Colors.green;
    } else if (temp > 30) {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }
}
