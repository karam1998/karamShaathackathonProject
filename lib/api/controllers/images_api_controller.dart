import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon/helpers/helpers.dart';
import 'package:hackathon/models/event_image.dart';
import 'package:hackathon/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../api_settings.dart';

typedef UploadImageCallback = void Function({
  required bool status,
  required String message,
  EventImage? studentImage,
});

class ImagesApiController with Helpers {
  Future<void> uploadImage(BuildContext context,
      {required String path,
      required UploadImageCallback uploadImageCallback}) async {
    var url = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
    var request = http.MultipartRequest('POST', url);
    http.MultipartFile imageFile =
        await http.MultipartFile.fromPath('image', path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    // request.fields['name'] = 'Name';

    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print('StatusCOde: ${response.statusCode}');
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(value);
        EventImage studentImage = EventImage.fromJson(jsonResponse['data']);

        uploadImageCallback(
            status: true,
            message: jsonResponse['message'],
            studentImage: studentImage);

        // showSnackBar(context: context, message: jsonResponse['message']);

      } else if (response.statusCode == 400) {
        uploadImageCallback(
          status: false,
          message: jsonDecode(value)['message'],
        );

        // showSnackBar(context: context, message: jsonDecode(value)['message'],error: true);

      } else if (response.statusCode == 500) {
        uploadImageCallback(
          status: false,
          message: 'Something went wrong, try again!',
        );

        // showSnackBar(context: context, message: 'Something went wrong, try again!',error: true);
      }
    });
  }

  Future<List<EventImage>> images(BuildContext context) async {
    var url = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var imagesJsonArray = jsonDecode(response.body)['data'] as List;
      return imagesJsonArray
          .map((imageJsonObject) => EventImage.fromJson(imageJsonObject))
          .toList();
    } else {
      showSnackBar(
        context: context,
        message: 'Something went wrong, try again!',
        error: true,
      );
    }
    return [];
  }

  Future<bool> deleteImage(BuildContext context, {required int id}) async {
    var url = Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
    var response = await http.delete(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });

    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else {
      showSnackBar(
          context: context,
          message: 'Something went wrong, try again',
          error: true);
    }
    return false;
  }
}
