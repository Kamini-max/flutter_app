import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../data/loaction.dart';


const String url = "https://www.tcs.com/content/dam/global-tcs/en/worldwide-json/worldwide-map-5-12.json";

List<Location> parseUser(String responseBody){
  final body = json.decode(responseBody);
  final List loc = body["locations"];
  final List<Location> locList = loc.map((e) => Location.fromJson(e)).toList();
  return locList;
}


Future<List<Location>> fetchUsers() async{
  final http.Response response = await http.get(Uri.parse(url),headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    return compute(parseUser,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
