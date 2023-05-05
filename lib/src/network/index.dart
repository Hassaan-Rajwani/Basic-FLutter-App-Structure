import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkCalls {
  Future get({required Uri url}) async {
    Response response = await http.get(url);
    if (response.statusCode >= 300) {
      throw HttpException(response.body);
    }
    return json.decode(response.body);
  }
}
