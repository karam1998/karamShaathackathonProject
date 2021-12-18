import 'dart:convert';
import 'dart:io';

import 'package:hackathon/models/category.dart';
import 'package:hackathon/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;
import '../api_settings.dart';

class UserApiController {
  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: SharedPrefController().token},
    );print( SharedPrefController().token);
    if (response.statusCode == 200) {
      print("we are her");
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
// Future<List<Event>> getEvent(String id) async {
//   var url = Uri.parse(ApiSettings.event + id.toString());
//   var response = await http.get(url, headers: {
//     HttpHeaders.authorizationHeader:SharedPrefController().token
//
//
//   });
//   print(jsonDecode(response.body)['list']);
//   if (response.statusCode == 200) {
//     var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
//     return categoriesJsonArray
//         .map((jsonObject) => Event.fromJson(jsonObject))
//         .toList();
//   }
//   return [];
// }
}
