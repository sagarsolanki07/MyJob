import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myjob/allfun.dart';

class Detail extends StatelessWidget {
  String cn='',
   ty='',
   sl='',
   lc='',
   dt='';

  Detail(this.cn,this.ty,this.sl,this.lc,this.dt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5,bottom: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 190,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image(
                                image: AssetImage(
                                  'assets/images/bg.jpeg',
                                ),
                                fit: BoxFit.fitWidth,
                               ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.white12,
                              child: AppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: Colors.transparent,
                                elevation: 0.0,
                                centerTitle: false,
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        radius: 30,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_sharp,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),

                                    Expanded(
                                        child: Container(
                                      child: text(
                                        'Details',
                                        c: Colors.white,
                                        s: 20,
                                      ),
                                      alignment: Alignment.center,
                                    )),
                                    CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        radius: 30,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) {
                                               return Drawer(

                                                 width: 100,
                                                 child: ListView(
                                                   padding: const EdgeInsets.all(0),
                                                   children: [
                                                     const DrawerHeader(
                                                       decoration: BoxDecoration(
                                                         color: Colors.green,
                                                       ), //BoxDecoration
                                                       child: UserAccountsDrawerHeader(
                                                         decoration: BoxDecoration(color: Colors.green),
                                                         accountName: Text(
                                                           "Abhishek Mishra",
                                                           style: TextStyle(fontSize: 18),
                                                         ),
                                                         accountEmail: Text("abhishekm977@gmail.com"),
                                                         currentAccountPictureSize: Size.square(50),
                                                         currentAccountPicture: CircleAvatar(
                                                           backgroundColor: Color.fromARGB(255, 165, 255, 137),
                                                           child: Text(
                                                             "A",
                                                             style: TextStyle(fontSize: 30.0, color: Colors.blue),
                                                           ), //Text
                                                         ), //circleAvatar
                                                       ), //UserAccountDrawerHeader
                                                     ), //DrawerHeader
                                                     ListTile(
                                                       leading: const Icon(Icons.person),
                                                       title: const Text(' My Profile '),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                     ListTile(
                                                       leading: const Icon(Icons.book),
                                                       title: const Text(' My Course '),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                     ListTile(
                                                       leading: const Icon(Icons.workspace_premium),
                                                       title: const Text(' Go Premium '),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                     ListTile(
                                                       leading: const Icon(Icons.video_label),
                                                       title: const Text(' Saved Videos '),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                     ListTile(
                                                       leading: const Icon(Icons.edit),
                                                       title: const Text(' Edit Profile '),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                     ListTile(
                                                       leading: const Icon(Icons.logout),
                                                       title: const Text('LogOut'),
                                                       onTap: () {
                                                         Navigator.pop(context);
                                                       },
                                                     ),
                                                   ],
                                                 ),
                                               );
                                                },
                                            ));
                                          },
                                          icon: Icon(
                                            Icons.dehaze,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 145),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black54,
                            child: Icon(
                              Icons.apple_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: text(
                      ty,
                      c: Colors.white,
                      s: 25.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: text(
                      cn,
                      s: 18.0,
                      c: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(children: [
                id('Salary', '\$'+sl, CupertinoIcons.money_dollar_circle),
                id('JOb Time', 'Full Time', Icons.timer_outlined),
                id('Location', lc, Icons.location_on_outlined),
              ]),
            ),
            Expanded(

              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: text('Description', s: 25, c: Colors.white70),
                      margin: EdgeInsets.only(top: 10, bottom: 10, left: 25),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,

                          child: text(
                              dt,
                              s: 16,
                              c: Colors.white38),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              margin:  EdgeInsets.only(
                  top: 30,left: 25,right: 25
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: text('Apply Now',s: 18.0,c: Colors.black),
                    ),
                  ),
                  Container(

                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        iconSize: 25,
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
