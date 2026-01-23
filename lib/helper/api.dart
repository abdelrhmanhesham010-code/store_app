import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constans.dart';

class Api {
  final Dio dio = Dio();
  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('ooooH fuck  ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await Dio().post(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return response.data;
    } else {
      throw Exception(response.data);
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $url body = $data token = $token');
    Response response = await Dio().post(url);
    if (response.statusCode == 200 ||
        response.data == 201 ||
        response.data == 202 ||
        response.data == 204) {
      Map<String, dynamic> data = response.data;
      return response.data;
    } else {
      throw Exception(response.data);
    }
  }
}
