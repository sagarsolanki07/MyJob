import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/jobs.dart';

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
  } else {
    return list;
  }
}



  Future<dynamic> deleteApi(id) async {
    var response1 = await http.delete(
        Uri.parse("https://63edd49b5e9f1583bdb6e265.mockapi.io/job/" + id));
    return response1;
  }

  Future<dynamic> addStudent(id,companyName,jobtype) async {
    var map = {};
    map['id'] = id.text;
    map['Company'] = companyName.text;
    map['Jobtype'] = jobtype.text;

    var response = http.post(
        Uri.parse("https://63edd49b5e9f1583bdb6e265.mockapi.io/job"),
        body: map);

    return response;
  }

  Future<dynamic> editStudent(id,companyName,jobtype) async {
    var map = {};
    map['id'] = id;
    map['Company'] = companyName;
    map['Jobtype'] = jobtype;
    print(id.text);
    var response1 = http.put(
        Uri.parse("https://63edd49b5e9f1583bdb6e265.mockapi.io/job/" + id),
        body: map);
    print(map);
    return response1;
  }
