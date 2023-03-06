
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myjob/project/allfun.dart';
import 'package:myjob/api/printapi.dart';

import '../Models/jobs.dart';
import '../Models/api.dart';
import 'detail.dart';


class Alljobs extends StatefulWidget {
   const Alljobs({Key? key}) : super(key: key);
   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Alljobs> {
  int pageIndex = 0;

  final pages = [
     const Alljobs(),
    const Alljobs(),
    const Alljobs(),
    const Alljobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(top: 25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: text(
                          'Good Morning!',
                          c: Colors.white70,
                          s: 16.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: text(
                          'Sagar Solanki',
                          s: 18.0,
                          c: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const Pa();
                          },
                        ));
                      },
                      iconSize: 35,
                      color: Colors.white,
                      icon: const ImageIcon(AssetImage("assets/images/n.png")),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: text('Let`s Find Your\nDream Job!', s: 36.0),
              margin: const EdgeInsets.only( left: 20),
              // text("Create A"),
            ),

            sr(),
            Column(
                children: <Widget>[

              DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0  ,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TabBar(
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onTap: (value) {},
                          tabs: [
                            sl('Recomendation',
                                Icons.account_circle_sharp),
                            sl('Analtic', Icons.analytics_rounded),
                            sl('Newest', Icons.new_releases_sharp),
                            sl('Popular', Icons.trending_up_outlined),
                          ],
                        ),
                        FutureBuilder<List<Jobs>>(builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Container(
                                height: MediaQuery.of(context).size.height*0.5,
                                padding: const EdgeInsets.all(20),
                                //height of TabBarView
                                child: TabBarView(children: <Widget>[

                                  ListView.builder(itemBuilder: (context, index) {
                                    return Container(
                                      height: 310,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,

                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/bg1.jpeg'),
                                              fit: BoxFit.fill),

                                          Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30),

                                              ),
                                              color: Colors.white12,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 23,
                                                    right: 22,
                                                    top: 15,
                                                    bottom: 15
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10)),
                                                          child:
                                                          const CircleAvatar(
                                                            radius: 18,
                                                            backgroundColor:
                                                            Colors
                                                                .black54,
                                                            child: Icon(
                                                              Icons
                                                                  .apple_rounded,
                                                              color: Colors
                                                                  .white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                bottom: 5,
                                                                top: 5),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].jobtype.toString(),
                                                                    c: Colors
                                                                        .white,
                                                                    s: 18.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].company.toString(),
                                                                    s: 16.0,
                                                                    c: Colors
                                                                        .white70,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .bookmark_added_rounded,
                                                          color:
                                                          Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          top: 11),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Full Time',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Offline',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    30),
                                                                color: Colors
                                                                    .black54),
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left:
                                                                10,
                                                                right:
                                                                10),
                                                            child: text(
                                                                '1 Years Exp',
                                                                c: Colors
                                                                    .white70,
                                                                s: 15.0),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin:
                                                        const EdgeInsets.only(

                                                            bottom: 20),
                                                        child: text(
                                                            snapshot.data![index].sortdetail.toString(),
                                                            s: 14.0,
                                                            c: Colors
                                                                .white60),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                              child: text(
                                                                  "\$${snapshot.data![index].salary}",
                                                                  s: 20),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  50)),
                                                        ),
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                30),
                                                          ),

                                                          padding: const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              5,
                                                              top: 5,
                                                              right: 10,
                                                              left: 15),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets.only(
                                                                    right:
                                                                    8),
                                                                child:
                                                                text(
                                                                  '1 Week Ago',
                                                                  s: 15.0,
                                                                  c: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                  Colors
                                                                      .black,
                                                                  radius: 17,



                                                                  child: IconButton(onPressed: () {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (context) {
                                                                        return Detail(snapshot.data![index].company.toString(),snapshot.data![index].jobtype.toString(),snapshot.data![index].salary.toString(),snapshot.data![index].location.toString(),snapshot.data![index].detail.toString());
                                                                      },
                                                                    ));
                                                                  },
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      size:
                                                                      18,
                                                                      color: Colors
                                                                          .white,),)
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                    //  return jobcard(snapshot.data![index].company.toString(),);
                                  },itemCount : Random().nextInt(snapshot.data!.length),),
                                  ListView.builder(itemBuilder: (context, index) {
                                    return Container(
                                      height: 310,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,

                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/bg1.jpeg'),
                                              fit: BoxFit.fill),

                                          Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30),

                                              ),
                                              color: Colors.white12,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 23,
                                                    right: 22,
                                                    top: 15,
                                                    bottom: 15
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10)),
                                                          child:
                                                          const CircleAvatar(
                                                            radius: 18,
                                                            backgroundColor:
                                                            Colors
                                                                .black54,
                                                            child: Icon(
                                                              Icons
                                                                  .apple_rounded,
                                                              color: Colors
                                                                  .white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                bottom: 5,
                                                                top: 5),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].jobtype.toString(),
                                                                    c: Colors
                                                                        .white,
                                                                    s: 18.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].company.toString(),
                                                                    s: 16.0,
                                                                    c: Colors
                                                                        .white70,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .bookmark_added_rounded,
                                                          color:
                                                          Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          top: 11),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Full Time',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Offline',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    30),
                                                                color: Colors
                                                                    .black54),
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left:
                                                                10,
                                                                right:
                                                                10),
                                                            child: text(
                                                                '1 Years Exp',
                                                                c: Colors
                                                                    .white70,
                                                                s: 15.0),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin:
                                                        const EdgeInsets.only(

                                                            bottom: 20),
                                                        child: text(
                                                            snapshot.data![index].sortdetail.toString(),
                                                            s: 14.0,
                                                            c: Colors
                                                                .white60),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                              child: text(
                                                                  "\$${snapshot.data![index].salary}",
                                                                  s: 20),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  50)),
                                                        ),
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                30),
                                                          ),

                                                          padding: const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              5,
                                                              top: 5,
                                                              right: 10,
                                                              left: 15),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets.only(
                                                                    right:
                                                                    8),
                                                                child:
                                                                text(
                                                                  '1 Week Ago',
                                                                  s: 15.0,
                                                                  c: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                  Colors
                                                                      .black,
                                                                  radius: 17,



                                                                  child: IconButton(onPressed: () {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (context) {
                                                                        return Detail(snapshot.data![index].company.toString(),snapshot.data![index].jobtype.toString(),snapshot.data![index].salary.toString(),snapshot.data![index].location.toString(),snapshot.data![index].detail.toString());
                                                                      },
                                                                    ));
                                                                  },
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      size:
                                                                      18,
                                                                      color: Colors
                                                                          .white,),)
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                    //  return jobcard(snapshot.data![index].company.toString(),);
                                  },itemCount: Random().nextInt(snapshot.data!.length),),
                                  ListView.builder(itemBuilder: (context, index) {
                                    return Container(
                                      height: 310,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,

                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/bg1.jpeg'),
                                              fit: BoxFit.fill),

                                          Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30),

                                              ),
                                              color: Colors.white12,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 23,
                                                    right: 22,
                                                    top: 15,
                                                    bottom: 15
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10)),
                                                          child:
                                                          const CircleAvatar(
                                                            radius: 18,
                                                            backgroundColor:
                                                            Colors
                                                                .black54,
                                                            child: Icon(
                                                              Icons
                                                                  .apple_rounded,
                                                              color: Colors
                                                                  .white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                bottom: 5,
                                                                top: 5),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].jobtype.toString(),
                                                                    c: Colors
                                                                        .white,
                                                                    s: 18.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].company.toString(),
                                                                    s: 16.0,
                                                                    c: Colors
                                                                        .white70,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .bookmark_added_rounded,
                                                          color:
                                                          Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          top: 11),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Full Time',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Offline',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    30),
                                                                color: Colors
                                                                    .black54),
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left:
                                                                10,
                                                                right:
                                                                10),
                                                            child: text(
                                                                '1 Years Exp',
                                                                c: Colors
                                                                    .white70,
                                                                s: 15.0),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin:
                                                        const EdgeInsets.only(

                                                            bottom: 20),
                                                        child: text(
                                                            snapshot.data![index].sortdetail.toString(),
                                                            s: 14.0,
                                                            c: Colors
                                                                .white60),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                              child: text(
                                                                  "\$${snapshot.data![index].salary}",
                                                                  s: 20),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  50)),
                                                        ),
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                30),
                                                          ),

                                                          padding: const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              5,
                                                              top: 5,
                                                              right: 10,
                                                              left: 15),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets.only(
                                                                    right:
                                                                    8),
                                                                child:
                                                                text(
                                                                  '1 Week Ago',
                                                                  s: 15.0,
                                                                  c: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                  Colors
                                                                      .black,
                                                                  radius: 17,



                                                                  child: IconButton(onPressed: () {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (context) {
                                                                        return Detail(snapshot.data![index].company.toString(),snapshot.data![index].jobtype.toString(),snapshot.data![index].salary.toString(),snapshot.data![index].location.toString(),snapshot.data![index].detail.toString());
                                                                      },
                                                                    ));
                                                                  },
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      size:
                                                                      18,
                                                                      color: Colors
                                                                          .white,),)
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                    //  return jobcard(snapshot.data![index].company.toString(),);
                                  },itemCount: Random().nextInt(snapshot.data!.length),),
                                  ListView.builder(itemBuilder: (context, index) {
                                    return Container(
                                      height: 310,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,

                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/bg1.jpeg'),
                                              fit: BoxFit.fill),

                                          Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30),

                                              ),
                                              color: Colors.white12,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 23,
                                                    right: 22,
                                                    top: 15,
                                                    bottom: 15
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10)),
                                                          child:
                                                          const CircleAvatar(
                                                            radius: 18,
                                                            backgroundColor:
                                                            Colors
                                                                .black54,
                                                            child: Icon(
                                                              Icons
                                                                  .apple_rounded,
                                                              color: Colors
                                                                  .white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                bottom: 5,
                                                                top: 5),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].jobtype.toString(),
                                                                    c: Colors
                                                                        .white,
                                                                    s: 18.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: text(
                                                                    snapshot.data![index].company.toString(),
                                                                    s: 16.0,
                                                                    c: Colors
                                                                        .white70,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .bookmark_added_rounded,
                                                          color:
                                                          Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          top: 11),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Full Time',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(alignment: Alignment.center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      30),
                                                                  color: Colors
                                                                      .black54),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10),
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: text(
                                                                  'Offline',
                                                                  c: Colors
                                                                      .white70,
                                                                  s: 15.0),
                                                            ),
                                                          ),
                                                          Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    30),
                                                                color: Colors
                                                                    .black54),
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left:
                                                                10,
                                                                right:
                                                                10),
                                                            child: text(
                                                                '1 Years Exp',
                                                                c: Colors
                                                                    .white70,
                                                                s: 15.0),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin:
                                                        const EdgeInsets.only(

                                                            bottom: 20),
                                                        child: text(
                                                            snapshot.data![index].sortdetail.toString(),
                                                            s: 14.0,
                                                            c: Colors
                                                                .white60),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                              child: text(
                                                                  "\$${snapshot.data![index].salary}",
                                                                  s: 20),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  50)),
                                                        ),
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors
                                                                .white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                30),
                                                          ),

                                                          padding: const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              5,
                                                              top: 5,
                                                              right: 10,
                                                              left: 15),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets.only(
                                                                    right:
                                                                    8),
                                                                child:
                                                                text(
                                                                  '1 Week Ago',
                                                                  s: 15.0,
                                                                  c: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                  Colors
                                                                      .black,
                                                                  radius: 17,



                                                                  child: IconButton(onPressed: () {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (context) {
                                                                        return Detail(snapshot.data![index].company.toString(),snapshot.data![index].jobtype.toString(),snapshot.data![index].salary.toString(),snapshot.data![index].location.toString(),snapshot.data![index].detail.toString());
                                                                      },
                                                                    ));
                                                                  },
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      size:
                                                                      18,
                                                                      color: Colors
                                                                          .white,),)
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                    //  return jobcard(snapshot.data![index].company.toString(),);
                                  },itemCount: Random().nextInt(snapshot.data!.length),),


                                ]));
                          }
                          else{
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                            future: callJobapi())


                      ])),
            ]),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBarTheme(data: const BottomNavigationBarThemeData( backgroundColor: Colors.black,), child: Container(
                  height: 75,
                  margin: const EdgeInsets.only(left:25,right:25,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:  BorderRadius.circular(
                        40
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 0;
                          });
                        },
                        icon: pageIndex == 0
                            ? const Icon(
                          Icons.home_filled,
                          color: Colors.black,
                          size: 30,
                        )
                            : const Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 1;
                          });
                        },
                        icon: pageIndex == 1
                            ? const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        )
                            : const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 2;
                          });
                        },
                        icon: pageIndex == 2
                            ? const Icon(
                          Icons.perm_contact_calendar,
                          color: Colors.black,
                          size: 30,
                        )
                            : const Icon(
                          Icons.perm_contact_calendar_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 3;
                          });
                        },
                        icon: pageIndex == 3
                            ? const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 30,
                        )
                            : const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],

                  ),
                ),),
              ),
            )

          ],
        ),
      )


    );
  }
}
