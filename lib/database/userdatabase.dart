import 'package:flutter/material.dart';
import 'package:myjob/database/databaseapi.dart';
import '../Models/dm.dart';
import '../Models/jobs.dart';
import '../Models/api.dart';


class AddUser extends StatefulWidget {
  Map? map;

  AddUser(this.map);

  @override
  State<AddUser> createState() => _AddUserState();

  GlobalKey<FormState> formKey = GlobalKey();

  var companyName = TextEditingController();
  var id = TextEditingController();
  var jobtype = TextEditingController();
}

class _AddUserState extends State<AddUser> {
  var userName = TextEditingController();

  void initState() {
    widget.companyName.text =
        widget.map == null ? '' : widget.map!['CompanyName'].toString();
    widget.id.text = widget.map == null ? '' : widget.map!['Id'].toString();
    widget.jobtype.text =
        widget.map == null ? '' : widget.map!['JObType'].toString();
  }
  Dm? _ddSelectedValue;
  bool isjobType = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Login',style: TextStyle(),),),
        body: Column(

          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [


            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    // key: formKey,
                    child: Card(
                      color: Colors.grey[100],
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Text('data'),
                            // FutureBuilder<List<Dm>>(
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasData) {
                            //       if (isjobType) {
                            //         _ddSelectedValue = snapshot.data?[1];
                            //         isjobType = false;
                            //       }
                            //       return DropdownButton(
                            //         value: _ddSelectedValue,
                            //         items: snapshot.data?.map(( e) {
                            //           return DropdownMenuItem(
                            //               value: e,
                            //               child: Text(
                            //                 e.jt.toString(),
                            //               ));
                            //         }).toList(),
                            //         onChanged: (value) {
                            //           setState(() {
                            //             _ddSelectedValue = value;
                            //           });
                            //         },
                            //       );
                            //     } else {
                            //       return CircularProgressIndicator();
                            //     }
                            //   },
                            //   future:   isjobType ? Databaseapi().gejob(): null,
                            // ),

                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text(
                                  'Enter Semester',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            TextFormField(
                              controller: widget.companyName,
                              decoration: const InputDecoration(
                                  hintText: "Enter companyName"),

                            ),
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text(
                                  'Department',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            TextFormField(
                              controller: widget.jobtype,
                              decoration: const InputDecoration(
                                  hintText: "Enter jontype"),

                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                onPressed: ()  async {
                                  if (widget.map == null) {
                                     int id = await insertUser();
                                     if (id!=0) {
                                       print('done');
                                       setState(() {});
                                     }

                                  } else {
                                    int id = await updateUser(widget.map!['Id']);
                                    if (id!=0) {
                                      print('done');
                                      setState(() {});
                                    }
                                  }
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<int> insertUser() async {
    Map<String,dynamic> map = {};
    map['JObType'] = widget.jobtype.text;
    map['CompanyName'] = widget.companyName.text;
    int id = await Databaseapi().inserData(map);
  print(map);
    return id;
  }
  Future<int> updateUser(id) async {
    Map<String,dynamic> map = {};
    map['JObType'] = widget.jobtype.text;
    map['CompanyName'] = widget.companyName.text;
    int userid = await Databaseapi().updateData(map,id);
    print(map);
    return userid;
  }

}

