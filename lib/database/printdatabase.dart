import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/jobs.dart';

import '../Models/api.dart';
import 'package:http/http.dart' as http;

import 'databaseapi.dart';
import 'userdatabase.dart';

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

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          builder: (context, snapshot1) {
            if (snapshot1.hasData) {
              return FutureBuilder<List<Map<String, Object?>>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Text(snapshot.data![0].toString());
                    return Column(
                      children: [
                        AppBar(
                            title: IconButton(
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return AddUser(null);

                                    },
                                  )).then((value) {
                                    if (value) {
                                      print('done');
                                      setState(() {
                                      });
                                    }
                                  });


                                },
                                icon: Icon(CupertinoIcons.add))),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Row(children: [
                                Text(snapshot.data![index]['Id'].toString()),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text(snapshot.data![index]
                                                ['CompanyName']
                                            .toString()))),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text(snapshot.data![index]
                                                ['Salary']
                                            .toString()))),
                                IconButton(
                                    onPressed: () async {
                                      int res =
                                          await Databaseapi().deleteData(snapshot.data, snapshot.data![index]['Id']);
                                      if (res!=0) {
                                        print('done');
                                        setState(() {});
                                      }
                                    },
                                    icon: Icon(CupertinoIcons.delete)),
                                IconButton(
                                    onPressed: () async {
                                      await Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) {
                                          return AddUser(snapshot.data![index]);

                                        },
                                      )).then((value) {
                                       if (value) {
                                         print('done');
                                         setState(() {
                                         });
                                       }
                                     });


                                    },
                                    icon: Icon(CupertinoIcons.add))
                              ]);
                            },
                            itemCount: snapshot.data?.length,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
                future: Databaseapi().getData(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
          future: Databaseapi().copyPasteAssetFileToRoot()),
      // body:  FutureBuilder<List<Map<String, Object?>>>(
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       // return Text(snapshot.data![0].toString());
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           return Text('hello');
      //         },
      //         itemCount: snapshot.data!.length,
      //       );
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      //   future: Databaseapi().getData(),
      // )
    );
  }
}
