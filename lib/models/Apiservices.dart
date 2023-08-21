import 'package:flutter_application_2/models/Data.dart';
import 'package:flutter_application_2/models/FeedbackModel.dart';
import 'package:flutter_application_2/models/NgoAction.dart';
import 'package:flutter_application_2/models/UsersReg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'CatMas.dart';

class APIServices {
  static Future<List<Users>> fetchUsers() async {
    var res = await http
        .get(Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Registration'));
    return usersFromJson(res.body);
  }

  static Future<List<Users>> fetchUsersbyMob(String mob) async {
    var res = await http.get(Uri.parse(
        'http://103.87.24.58/HelpTheNeedyAPI/api/Registration/' + mob));
    return usersFromJson(res.body);
  }

  static Future fetchNGOCat() async {
    var res = await http
        .get(Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/NGOList'));
    return res.body;
  }

  static Future fetchNGOlist(String cat) async {
    var res = await http.get(
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/NGOList/' + cat));
    return res.body;
  }

  static Future fetchUsersid(String id) async {
    return await http.get(Uri.parse(
        'http://103.87.24.58/HelpTheNeedyAPI/api/Registration/' + id));
  }

  static Future<List<CatMas>> fetchCat() async {
    try {
      var response = await http
          .get(Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Category'));
      if (response.statusCode == 200) {
        // final List<User> user = userFromJson(response.body);
        // return user;

        return catMasFromJson(response.body);
      } else {
        return throw Exception('Failed to load ...');
      }
    } catch (e) {
      return throw Exception('Failed to load ...');
    }
  }

  static Future postUsers(Users users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Registration'),
        headers: header,
        body: usersBody);
    print(res.body);
    return res.statusCode;
  }

  static Future<http.Response> fetchNeedyDataCat(String id) async {
    return await http
        .get(Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Data/' + id));
  }

  static Future<http.Response> fetchNeedyData() async {
    return await http
        .get(Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Data'));
  }

  static Future postNeedyData(NeedyData users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Data'),
        headers: header,
        body: usersBody);
    print(res.body);
    return res.body;
  }

  static Future<List<Ngo>> fetchNGoData(String id) async {
    print(id);
    var res = await http.get(
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/NgoAction/' + id));
    return ngoFromJson(res.body);
  }

  static Future postNGoData(Ngo users) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUsers = users.toJson();
    var usersBody = json.encode(myUsers);
    var res = await http.post(
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/NgoAction'),
        headers: header,
        body: usersBody);
    print(res.body);
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
        Uri.parse('http://103.87.24.58/HelpTheNeedyAPI/api/Feedback'),
        headers: header,
        body: usersBody);
    print(res.statusCode);
    return res.statusCode;
  }
}
