
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;

class APIProvider {
  Future<dynamic> get(String url , Map<String,String> headers) async {
    dynamic responseJson;
    try {
      final http.Response response = await http.get(Uri.parse(url), headers: headers);
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202){
        responseJson = json.decode(response.body);
      }
      else{
        throw Exception(["backend_error",response.statusCode]);
      }
    }on SocketException {
      throw Exception(["internet_error",]);
    }
    return responseJson;
  }
}