import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/jobs.dart';

import '../api.dart';
import 'package:http/http.dart' as http;

import '../databaseapi.dart';


class Pd extends StatefulWidget {
  const Pd({Key? key}) : super(key: key);

  @override
  State<Pd> createState() => _PaState();
}

class _PaState extends State<Pd> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Databaseapi().initDatabase().then((value) {
      print('done');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Jobs>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  AppBar(title:  IconButton(
                    // onPressed: () async {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) {
                    //       return AddUser(null);
                    //
                    //     },
                    //   )).then((value) => (value) {
                    //     setState(() {
                    //
                    //     });
                    //   });
                    // },
                      onPressed: () {

                      },
                      icon: Icon(CupertinoIcons.add))),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return Row(children: [
                  //         Text(snapshot.data![index].id.toString()),
                  //         Expanded(
                  //             child: Container(
                  //                 alignment: Alignment.center,
                  //                 child: Text(
                  //                     snapshot.data![index].company.toString()))),
                  //         Expanded(
                  //             child: Container(
                  //                 alignment: Alignment.center,
                  //                 child: Text(
                  //                     snapshot.data![index].jobtype.toString()))),
                  //         IconButton(
                  //             onPressed: () async {
                  //               http.Response res = await Apioperation(null).deleteApi(
                  //                   snapshot.data![index].id.toString());
                  //               if (res.statusCode == 200) {
                  //                 setState(() {
                  //                 });
                  //               }
                  //             },
                  //             icon: Icon(CupertinoIcons.delete)),
                  //         IconButton(
                  //             // onPressed: ()  async {
                  //             //   await Navigator.of(context).push(MaterialPageRoute(
                  //             //     builder: (context) {
                  //             //       return AddUser(snapshot.data![index]);
                  //             //
                  //             //     },
                  //             //   )).then((value) {
                  //             //     if (value) {
                  //             //       print('done');
                  //             //       setState(() {
                  //             //       });
                  //             //     }
                  //             //   });
                  //             //
                  //             // },
                  //           onPressed: () {
                  //
                  //           },
                  //             icon: Icon(CupertinoIcons.add))
                  //       ]);
                  //     },
                  //     itemCount: snapshot.data?.length,
                  //   ),
                  // ),
                  Expanded(child: Text('done'))
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
          future: callJobapi()),
    );
  }
}
