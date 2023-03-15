
import 'package:flutter/material.dart';
import 'package:myjob/project/allfun.dart';

import 'alljobs.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height; // Gives the height

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg.jpeg', fit: BoxFit.fill),
          Container(
            width: width,
            margin: EdgeInsets.only(
                top: height / 30, left: width / 15, right: width / 15),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: text('Create A'),

                        // text("Create A"),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: width / 95),
                              child: text(
                                'Better',
                              )),
                          Container(
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/bfg.png',
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: text(
                                      'Future',
                                      c: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: text(
                          'For Yourself',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: width / 80,

                        ),
                        child: FloatingActionButton(
                          onPressed: () => {},
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: ImageIcon(
                            AssetImage("assets/images/g.png"),
                            size: 30,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: width / 8,
                              top: height / 30,
                            ),
                            child: FloatingActionButton(
                              onPressed: () => {},
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              child: ImageIcon(
                                AssetImage("assets/images/l.png"),
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: width / 3,
                            ),
                            child: FloatingActionButton(
                              onPressed: () => {},
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              child: ImageIcon(AssetImage("assets/images/d.png"),
                                  size: 30),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: width / 50,
                        ),
                        child: FloatingActionButton(
                          onPressed: () => {},
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: ImageIcon(AssetImage("assets/images/f.png"),
                              size: 30),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width/7, top: height/30),
                            child: FloatingActionButton(
                              onPressed: () => {},
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              child: ImageIcon(AssetImage("assets/images/c.png"),
                                  size: 30),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: width/3,
                            ),
                            child: FloatingActionButton(
                              onPressed: () => {},
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              child: ImageIcon(AssetImage("assets/images/t.png"),
                                  size: 30),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: width/30),
                          child: FloatingActionButton(
                            onPressed: () => {},
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: ImageIcon(AssetImage("assets/images/m.png"),
                                size: 30),
                          )),
                    ],
                  ),
                ),
                BottomNavigationBarTheme(
                  data: const BottomNavigationBarThemeData( backgroundColor: Colors.black,),
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    margin:  EdgeInsets.only(
                      bottom: 15,top: 20
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child:  Center(
                            child: text('Start Now',s: 18.0,c: Colors.black),
                          ),
                        ),
                        Container(

                          padding: EdgeInsets.all(5),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 35,
                            child: IconButton(
                              onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return const Alljobs();
                                    },
                                  ));
                              },
                              iconSize: 25,
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
