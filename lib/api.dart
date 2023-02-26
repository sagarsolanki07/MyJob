import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Models/jobs.dart';

Future<List<Jobs>> callJobapi() async {
  http.Response res = await http
      .get(Uri.parse("https://63edd49b5e9f1583bdb6e265.mockapi.io/job"));
  dynamic map = jsonDecode(res.body.toString());
  List<Jobs> list = [];
  if (res.statusCode == 200) {

    for (Map i in map) {
      list.add(Jobs.fromJson(i));
    }
    return list;
  }
  else {
    return list;
  }

}
