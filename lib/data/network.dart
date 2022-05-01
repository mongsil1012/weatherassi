import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final Uri url;
  final Uri url2;
  final Uri url3;
  Network(this.url, this.url2, this.url3);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }else{
      print('There was a problem with getting weather API');
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(url2);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }else{
      print('There was a problem with getting weather API');
    }
  }

  Future<dynamic> getServerData() async {
    http.Response response = await http.get(url3);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }else{
      print('There was a problem with getting local server API');
      return null;
    }
  }
}