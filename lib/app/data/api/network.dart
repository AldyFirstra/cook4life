// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
export 'package:http/http.dart';
import 'package:get/get.dart';

import '../../global/controllers/app_controller.dart';

class ApiConfig {
  static const authority = 'cook4life.takhruj.com';
  static const BASE_URL = 'https://cook4life.takhruj.com/';
}

class API {
  static const bool _enableLogging = true;

  static Future<http.Response> get(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    headers = _addDefaultHeaders(headers);
    final res = await http.get(
        Uri.https(ApiConfig.authority, url, queryParameters),
        headers: headers);
    networkLogging(method: "GET", url: url, headers: headers, res: res);
    return res;
  }

  static Future<http.Response> post(String url,
      {Map<String, String>? headers,
      body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    headers = _addDefaultHeaders(headers);
    final res = await http.post(
        Uri.https(ApiConfig.authority, url, queryParameters),
        headers: headers,
        body: body,
        encoding: encoding);
    networkLogging(
        method: "POST",
        url: url,
        headers: headers,
        body: body,
        encoding: encoding,
        res: res);
    return res;
  }

  static Future<http.Response> put(String url,
      {Map<String, String>? headers,
      body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    headers = _addDefaultHeaders(headers);
    final res = await http.put(
        Uri.https(ApiConfig.authority, url, queryParameters),
        headers: headers,
        body: body,
        encoding: encoding);
    networkLogging(
        method: "PUT",
        url: url,
        headers: headers,
        body: body,
        encoding: encoding,
        res: res);
    return res;
  }

  static Future<http.Response> patch(String url,
      {Map<String, String>? headers,
      body,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters}) async {
    headers = _addDefaultHeaders(headers);
    final res = await http.patch(
        Uri.https(ApiConfig.authority, url, queryParameters),
        headers: headers,
        body: body,
        encoding: encoding);
    networkLogging(
        method: "PATCH",
        url: url,
        headers: headers,
        body: body,
        encoding: encoding,
        res: res);
    return res;
  }

  static Future<http.Response> delete(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    headers = _addDefaultHeaders(headers);
    final res = await http.delete(
        Uri.https(ApiConfig.authority, url, queryParameters),
        headers: headers);
    networkLogging(method: "DELETE", url: url, headers: headers, res: res);
    return res;
  }

  static _addDefaultHeaders(Map<String, String>? headers) {
    headers ??= {};
    headers['Authorization'] =
        'Bearer ${Get.find<AppController>().user?.token ?? ""}';
    headers['Accept'] = 'application/json';
    return headers;
  }

  static void networkLogging(
      {method,
      required String url,
      headers,
      body,
      encoding,
      required http.Response res}) {
    if (_enableLogging) {
      log("==========NETWORK LOGGING=============");
      log("$method REQUEST TO : " + ApiConfig.authority + url.toString());
      log("Status : " + res.statusCode.toString());
      log("Headers : " + headers.toString());
      if (body != null) {
        log("Body : " + body.toString());
      }
      if (encoding != null) {
        log("Encoding : " + encoding.toString());
      }
      log("Response : " + res.body);
      log("==========NETWORK LOGGING=============");
    }
  }
}
