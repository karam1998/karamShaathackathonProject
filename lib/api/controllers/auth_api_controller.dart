import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackathon/helpers/helpers.dart';
import 'package:hackathon/models/user.dart';
import 'package:hackathon/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_settings.dart';

class AuthApiController with Helpers {
  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var jsonObject = jsonDecode(response.body)['data'];
      User user = User.fromJson(jsonObject);
      await SharedPrefController().save(user: user);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

  Future logout() async {
    var url = Uri.parse(ApiSettings.logoutUser);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getToken(),
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
}
