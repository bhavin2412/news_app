import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modal/phoneModal.dart';

class PhoneProvider extends ChangeNotifier {
  /// country news carousel slider
  int? countryCount;
  List countryImages = [
    "assets/images/country_news_1.jpg",
    "assets/images/country_news_2.jpg",
    "assets/images/country_news_3.jpg",
    "assets/images/country_news_4.jpg",
    "assets/images/country_news_5.jpg"
  ];
  void countryChange(index) {
    countryCount = index;
    notifyListeners();
  }

  /// car news carousel slider
  int? i;
  List carImages = [
    "assets/images/car_news_1.jpg",
    "assets/images/car_news_2.jpg",
    "assets/images/car_news_3.jpg",
    "assets/images/car_news_4.jpeg",
    "assets/images/car_news_5.jpeg"
  ];
  void carChange(index) {
    i = index;
    notifyListeners();
  }

  /// phone news carousel slider
  int? ind;
  List images = [
    "assets/images/phone_news_1.jpg",
    "assets/images/phone_news_2.jpg",
    "assets/images/phone_news_3.jpg",
    "assets/images/phone_news_4.jpeg",
    "assets/images/phone_news_5.jpg"
  ];
  void change(index) {
    ind = index;
    notifyListeners();
  }

  /// country api
  String changeCountryString = "india";
  List countryList = ["india", "us", "japan", "china", "london"];
  void countryCountFunction(int index) {
    changeCountryString = countryList[index];
    notifyListeners();
  }

  /// car api
  String changeCarString = "tesla";
  List carList = ["tesla", "hyundai", "tata", "honda", "mahindra"];
  void carCount(int index) {
    changeCarString = carList[index];
    notifyListeners();
  }

  /// phone api
  Articles? artical;

  void nextPage(Articles data) {
    artical = data;
    notifyListeners();
  }

  String changeString = "apple";
  List phoneList = ["apple", "google", "mi", "samsung", "sony"];
  void phoneCount(int index) {
    changeString = phoneList[index];
    notifyListeners();
  }
}
