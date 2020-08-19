import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitr/utils/consts.dart';

import 'custom_exception.dart';


class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<Map> get(String url, {Map headers}) async{
    var client = new http.Client();
    try {
      var response = await client.get(url,
          headers: headers).timeout(
          const Duration(seconds: TIME_OUT_SECONDS));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new CustomException();
      }

    } on TimeoutException catch (_) {
      throw new CustomException(msg: TIME_OUT_MSG);
    } on Exception catch(e) {
      e.toString().contains('SocketException')? throw new CustomException(msg: SOCKET_EXCEPTION_MSG)
          : throw new CustomException(msg:"Error connecting to the server. Please try again");
    } finally {
      client.close();
    }
  }

  Future<Map> post(String url, {Map headers, Map body, encoding}) async{

    var client = new http.Client();

    try {

      var response = await client.post(Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      ).timeout(const Duration(seconds: TIME_OUT_SECONDS));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new CustomException();
      }
    } on TimeoutException catch(_) {
      throw new CustomException(msg: TIME_OUT_MSG);
    } on Exception catch(e) {
      print(e.toString());
      e.toString().contains('SocketException')? throw new CustomException(msg: SOCKET_EXCEPTION_MSG)
          : throw new CustomException(msg:e.toString());

    } finally {
      client.close();
    }
  }

  Future<Map> postProfilePic(String url, {Map headers, Map body, encoding}) async{
    var client = new http.Client();

    try {
      var response = await client.post(Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      ).timeout(const Duration(seconds: TIME_OUT_PROFILE_SECONDS));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new CustomException();
      }
    } on TimeoutException catch(_) {
      throw new CustomException(msg: TIME_OUT_MSG);
    } on Exception catch(e) {
      e.toString().contains('SocketException')? throw new CustomException(msg: SOCKET_EXCEPTION_MSG)
          : throw new CustomException(msg:"Error connecting to the server. Please try again");

    } finally {
      client.close();
    }
  }

  Future<Map> delete(String url, {Map headers}) async{
    var client = new http.Client();
    try {
      var response = await client.delete(url,
          headers: headers).timeout(
          const Duration(seconds: TIME_OUT_SECONDS));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new CustomException();
      }

    } on TimeoutException catch (_) {
      throw new CustomException(msg: TIME_OUT_MSG);
    } on Exception catch(e) {
      e.toString().contains('SocketException')? throw new CustomException(msg: SOCKET_EXCEPTION_MSG)
          : throw new CustomException(msg:"Error connecting to the server. Please try again");
    } finally {
      client.close();
    }
  }

  Future<Map> put(String url, {Map headers, Map body, encoding}) async{
    var client = new http.Client();

    try {
      var response = await client.put(Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      ).timeout(const Duration(seconds: TIME_OUT_SECONDS));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new CustomException();
      }
    } on TimeoutException catch(_) {
      throw new CustomException(msg: TIME_OUT_MSG);
    } on Exception catch(e) {
      e.toString().contains('SocketException')? throw new CustomException(msg: SOCKET_EXCEPTION_MSG)
          : throw new CustomException(msg:"Error connecting to the server. Please try again");

    } finally {
      client.close();
    }
  }
}