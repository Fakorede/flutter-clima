import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

const apiKey = "c30687115b9905bc5b5edc4bd18fc760";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    // double temperature = decodedData['main']['temp'];
    // int condition = decodedData['weather'][0]['id'];
    // String cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
