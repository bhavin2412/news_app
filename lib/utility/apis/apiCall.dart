import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/screens/phonePage/modal/phoneModal.dart';

class ApiCall {
  Future<PhoneModal?> callApi(String name) async {
    String phoneApi =
        "https://newsapi.org/v2/everything?q=$name&from=2023-02-16&to=2023-02-16&sortBy=popularity&apiKey=dd139bcde4e045e5b60bea63e5a9e41f";

    var response = await http.get(
      Uri.parse(phoneApi),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return PhoneModal.fromJson(json);
    } else {
      return null;
    }
  }
}
