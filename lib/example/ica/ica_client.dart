import 'dart:async';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

class Ping {
  String? msg;

  Ping();
}

class User {
  String? email, password;

  User();

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

Future<dynamic> sayHello() async {
  var url = "http://localhost:8000/api/health";
  var resp = await http.get(Uri.parse(url));
  if (resp.statusCode != 200) {
    return null;
  }
  var body = json.jsonDecode(resp.body);
  return body;
}

Future<String> signIn() async {
  var user = User();
  user.email = "hihi@gmail.com";
  user.password = "XDxJHKJgIguB";
  String jsonBody = json.jsonEncode(user.toJson());
  var url = "http://127.0.0.1:8000/api/v1/user/sign-in";
  var resp = await http.post(Uri.parse(url),
      body: jsonBody, encoding: const json.Utf8Codec(allowMalformed: true));
  if (resp.statusCode != 200) {
    return "${resp.statusCode}";
  }

  var body = json.jsonDecode(resp.body);
  return body;
}
