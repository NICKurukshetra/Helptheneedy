import 'package:flutter_application_2/models/Data.dart';
import 'package:flutter_application_2/models/FeedbackModel.dart';
import 'package:flutter_application_2/models/NgoAction.dart';
import 'package:flutter_application_2/models/UsersReg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIServices {
  static Future fetchUsers() async {
    return await http
        .get('http://103.87.24.57/HelpTheNeedyAPI/api/Registration');
  }

  static Future postUsers(Users users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        'http://103.87.24.57/HelpTheNeedyAPI/api/Registration',
        headers: header,
        body: usersBody);
    print(res.statusCode);
    return res.statusCode;
  }

  static Future<http.Response> fetchNeedyDataCat(String id) async {
    return await http.get('http://103.87.24.57/HelpTheNeedyAPI/api/Data/' + id);
  }

  static Future<http.Response> fetchNeedyData() async {
    return await http.get('http://103.87.24.57/HelpTheNeedyAPI/api/Data');
  }

  static Future postNeedyData(NeedyData users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post('http://103.87.24.57/HelpTheNeedyAPI/api/Data',
        headers: header, body: usersBody);
    print(res.body);
    return res.body;
  }

  static Future<http.Response> fetchNGoData(String id) async {
    return await http
        .get('http://103.87.24.57/HelpTheNeedyAPI/api/NgoAction/' + id);
  }

  static Future postNGoData(Ngo users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        'http://103.87.24.57/HelpTheNeedyAPI/api/NgoAction',
        headers: header,
        body: usersBody);
    print(res.statusCode);
    return res.statusCode;
  }

  static Future postFeedback(Feedbackmod users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        'http://103.87.24.57/HelpTheNeedyAPI/api/Feedback',
        headers: header,
        body: usersBody);
    print(res.statusCode);
    return res.statusCode;
  }
}
