import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:foodbank_marchantise_app/services/api-list.dart';

class Server {
  /*static final Server _instance = Server._internal();
  factory Server() => _instance;
  Server._internal();*/

  static String? bearerToken;

  static initClass({String? token}) {
    bearerToken = token!;
    print('-----------------------------------?>>>>>>>> $bearerToken');
  }

  getRequest({String? endPoint}) async {
    HttpClient client = HttpClient();
    print(endPoint);
    try {
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return await http.get(Uri.parse(APIList.server! + endPoint!),
          headers: _getHttpHeaders());
    } catch (error) {
      print('GET::::::::::::::::ERROR');
      print(APIList.server! + endPoint!);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }

  getRequestSettings(endPoint) async {
    HttpClient client = HttpClient();
    try {
      return await http.get(Uri.parse(APIList.server! + endPoint!),
          headers: getAuthHeaders());
    } catch (error) {
      print('GET::::::::::::::::ERROR');
      print(APIList.server! + endPoint!);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }


  getRequestWithParam({String? endPoint,var orderId}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return await http.get(Uri.parse(APIList.server !+ "restaurant-order/$orderId"), headers: _getHttpHeaders());
    } catch (error) {
      print('GET::::::::::::::::ERROR');
      print(APIList.server !+ "restaurant-order/$orderId");
      print(error);
      return null;
    } finally {
      client.close();
    }
  }

  multipartRequest({String? endPoint, body, String? filepath,type}) async {
    print(APIList.server! + endPoint!);
    print(body);
    Map<String, String> headers = {
      'Authorization': bearerToken!,
      'Content-Type': 'multipart/form-data',
    };
    HttpClient client = HttpClient();
    try {
      var request;
      if(type){
         request =
        http.MultipartRequest('POST', Uri.parse(APIList.server! + endPoint))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.add(await http.MultipartFile.fromPath('image', filepath!));
      }else{
         request =
        http.MultipartRequest('POST', Uri.parse(APIList.server! + endPoint))
          ..fields.addAll(body)
          ..headers.addAll(headers);
      }
      return await request.send();
    } catch (error) {
      print('POST::::::::::::::::ERROR');
      print(APIList.server! + endPoint);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }


  postRequest({String? endPoint, String? body}) async {
    print(APIList.server! + endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return await http.post(Uri.parse(APIList.server! + endPoint),
          headers: getAuthHeaders(), body: body);
    } catch (error) {
      print('POST::::::::::::::::ERROR');
      print(APIList.server! + endPoint);
      print(error);
      //  return null;
    } finally {
      client.close();
    }
  }

  postRequestWithToken({String? endPoint, String? body}) async {
    print(APIList.server! + endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return await http.post(Uri.parse(APIList.server! + endPoint),
          headers: _getHttpHeaders(), body: body);
    } catch (error) {
      print('POST::::::::::::::::ERROR');
      print(APIList.server! + endPoint);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }

  putRequest({String? endPoint, String? body}) async {
    print(APIList.server! + endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return await http.put(Uri.parse(APIList.server! + endPoint),
          headers: _getHttpHeaders(), body: body);
    } catch (error) {
      print('POST::::::::::::::::ERROR');
      print(APIList.server! + endPoint);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }



  putRequestChangeStatus({String? endPoint, String? body,int? id}) async {
    print(APIList.server! + endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return await http.put(Uri.parse(APIList.server! + endPoint),
          headers: _getHttpHeaders(), body: body);
    } catch (error) {
      print('POST::::::::::::::::ERROR');
      print(APIList.server! + endPoint);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }

  deleteRequest({String? endPoint}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return await http.delete(Uri.parse(APIList.server! + endPoint!),
          headers: _getHttpHeaders());
    } catch (error) {
      print('GET::::::::::::::::ERROR');
      print(APIList.server! + endPoint!);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }

  static Map<String, String> _getHttpHeaders() {
    Map<String, String> headers = new Map<String, String>();
    print(bearerToken);
    headers['Authorization'] = bearerToken!;
    headers['content-type'] = 'application/json';
    return headers;
  }

  static Map<String, String> getAuthHeaders() {
    Map<String, String> headers = new Map();
    headers['content-type'] = 'application/json';
    return headers;
  }

/*static Future getGrinzContacts(String url, String body) async {
    try {
      print('AUTH ' + url);
      return await http.post(
        url,
        headers: getAuthHeaders(),
        body: body,
      );
    } catch (error) {
      print('AUTH::::::::::::::::ERROR');
      print(url);
      print(error);
      return null;
    }
  }*/

  customGetRequest({String? endPoint, String? token}) async {
    HttpClient client = HttpClient();
    try {
      // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return await http.get(
        Uri.parse(APIList.server! + endPoint!),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token!
        },
      );
    } catch (error) {
      print('GET::::::::::::::::ERROR');
      print(APIList.server! + endPoint!);
      print(error);
      return null;
    } finally {
      client.close();
    }
  }
}
