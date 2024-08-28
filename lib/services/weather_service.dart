import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "e640ac88c49641d38b275733242505";
  //"f11b7f5c1847f536faad20dd39eaaf83";
  final String forecastBaseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  //'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=';
  final String searchBaseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  // 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=';

  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=1&aqi=no&alerts=no';
    //Uri.parse(
    //  forecastBaseUrl + searchBaseUrl + "f11b7f5c1847f536faad20dd39eaaf83");
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Weather data');
    }
  }

  Future<Map<String, dynamic>> fetch7DayForecast(String city) async {
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=1&aqi=no&alerts=no';
    // Uri.parse(
    //  forecastBaseUrl + searchBaseUrl + "f11b7f5c1847f536faad20dd39eaaf83");
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<dynamic>?> fetchCitySuggestion(String query) async {
    final url = '$searchBaseUrl?key=$apiKey&q=';
    //Uri.parse(
    //  forecastBaseUrl + searchBaseUrl + "f11b7f5c1847f536faad20dd39eaaf83");
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
