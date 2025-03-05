class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String apiKey = '88c69c90604b97232b2b3094e0a0d8a7';

  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&aapid=$apiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
