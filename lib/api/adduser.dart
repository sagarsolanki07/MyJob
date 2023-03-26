import 'package:flutter/material.dart';
import '../Models/jobs.dart';
import 'api.dart';


class AddUser extends StatefulWidget {
  Jobs? map;

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
        widget.map == null ? '' : widget.map!.company.toString();
    widget.id.text = widget.map == null ? '' : widget.map!.id.toString();
    widget.jobtype.text =
        widget.map == null ? '' : widget.map!.jobtype.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Login',style: TextStyle(),),),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
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
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text(
                                      'Enter Name',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextFormField(
                                  controller: widget.id,
                                  decoration:
                                      const InputDecoration(hintText: "Enter Name"),

                                ),
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
                                      hintText: "Enter Semester"),

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
                                      hintText: "Enter grgrgrDepartment"),

                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (widget.map == null) {
                                        await addStudent( widget.id,
                                            widget.companyName,
                                            widget.jobtype);

                                      } else {
                                        await editStudent( widget.id,
                                            widget.companyName,
                                            widget.jobtype)
                                            .then((value) {
                                                  setState(() {});
                                                });
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
          ],
        ),
      ),
    );
  }
}
