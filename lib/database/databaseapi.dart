import 'dart:io';
import 'package:flutter/services.dart';
import 'package:myjob/Models/dm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Models/jobs.dart';

class Databaseapi{
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'api.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "api.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'api.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await  File(path).writeAsBytes(bytes);
      return true;
    }
    return false;

  }
  Future<List<Map<String, Object?>>> getData() async {
    Database db=await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery('SELECT * FROM Jobs');
    return data;
  }

  Future<List<Dm>> gejob() async {
    Database db=await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery('SELECT * FROM Jobs');
    List<Dm> ls = [];
    for (int i=0;i<=data.length;i++){
      Dm d = Dm();
      d.id=int.parse(data[i]['Id'].toString());
      d.cn=data[i]['CompanyName'].toString();
      d.jt=data[i]['JObType'].toString();
      d.sl=int.parse(data[i]['Id'].toString());
      d.sd=data[i]['SortDetail'].toString();
      d.dt=data[i]['Detail'].toString();
      ls.add(d);
      print(ls[i].cn.toString());
      // print(ls.toString());
    }
    print(ls[1]);
    return ls;
  }
  Future<int> inserData(map) async {
    Database db=await initDatabase();
    int userid = await db.insert('Jobs',map);


    return userid;
  }
  Future<int> deleteData(map,id) async {
    Database db=await initDatabase();
    int userid = await db.delete('Jobs',where: 'Id = ?',whereArgs: [id]);


    return userid;
  }
  Future<int> updateData(map,id) async {
    Database db=await initDatabase();
    int userid = await db.update('Jobs',map,where: 'Id = ?',whereArgs: [id]);


    return userid;
  }
}