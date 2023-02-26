import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/jobs.dart';
import 'api.dart';

class Pa extends StatefulWidget {
  const Pa({Key? key}) : super(key: key);

  @override
  State<Pa> createState() => _PaState();
}

class _PaState extends State<Pa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Jobs>>(builder: (context, snapshot) {
      if(!snapshot.hasData){
        return CircularProgressIndicator();
      }
      else{
        return ListView.builder(itemBuilder: (context, index) {
          return Text(snapshot.data![index].id.toString());
        },itemCount: snapshot.data?.length,);
      }
    },
      future: callJobapi()),
    );
  }
}
