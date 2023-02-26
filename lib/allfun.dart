

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


sl( String name,IconData ic){
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.white12, width: 1),
      borderRadius:
      BorderRadius.circular(50),
    ),
    child: Row(
      children: [
        Icon(
          ic,
          color: Colors.white,
          size: 30,
        ),
        Container(
          margin: const EdgeInsets.only(
              left: 10),
          child:  Text(
            name,
            style:  const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    ),
  );

}
text(String st,{Color c=Colors.white,double s=45.0}){
  return Text(
    st,
    style: TextStyle(
        color: c,
        fontSize: s,
        fontFamily: 'Poppins1'),
  );
}
//
// MaterialPageRoute materialPageRoute = Custom() as MaterialPageRoute ;
// MaterialPage materialPage = Custom() as MaterialPage ;
// bt(AssetImage a,Material material,MaterialPage materialPage ){
//     return  FloatingActionButton(
//     onPressed: () => {
//     Navigator.of(context as BuildContext).push(materialPageRoute),
//     },
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//     child: ImageIcon(
//         AssetImage("a"),
//         size: 30),
//   );
// }
TextEditingController serch = TextEditingController();
 sr(){
  return Container(
    height: 50,
    margin: const EdgeInsets.only(right: 20, left: 20, top: 20,bottom: 20),
    child: TextField(
      controller: serch,
      decoration: InputDecoration(
        suffixIcon:const Icon(
          Icons.search,
          color: Colors.white60,
        ),
        labelText: "Type Your prefer job...",
        contentPadding:
        const EdgeInsets.only(left: 40, top: 20, bottom: 20),
        labelStyle: const TextStyle(color: Colors.white60),
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CupertinoColors.white,
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CupertinoColors.systemGrey4,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    ),
  );
}

id(String name,String detail,IconData ic){
   return Expanded(
     child: Container(
       child: Column(children: [
         CircleAvatar(child: Icon(ic,color: Colors.white,size: 25,),backgroundColor: Colors.white12,radius: 30),
         text(name,c: Colors.white24,s: 15),
         text(detail,c: Colors.white70,s: 15),
       ],),
     ),
   );
}
