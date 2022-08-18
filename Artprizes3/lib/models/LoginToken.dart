

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../DatabaseHelper.dart';

part 'LoginToken.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginToken {

  static String className = "LoginToken";
  static String tablename = className.toLowerCase();

 String created =
      DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now().toUtc()) +
          ".${DateTime.now().toUtc().millisecond}";

  String username;
  String token;
 

  LoginToken(this.username, this.token);

  factory LoginToken.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenFromJson(json);
  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = this.username;
    map['token'] = this.token;

    return map;
  }

  Map<String, dynamic> toMapDB() {
    var map = Map<String, dynamic>();
    map['username'] = this.username;
    map['token'] = this.token;
    map['created'] = this.created;
    return map;
  }

  LoginToken.fromMap(Map<String, dynamic> map) {
    // this.uId = map['uId'];
    this.username = map["username"];
    this.token = map["token"];
    this.created =  DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now().toUtc()) +
          ".${DateTime.now().toUtc().millisecond}";
  }

  static LoginToken convertFromJson(String json)
  {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    var object = LoginToken.fromMap(jsonMap);
    return object;
  }

//saving loginToken into the db
  persist() async {
     DatabaseHelper.internal().db.then((db) {
      print("In save $className");
      isExisting(this.username).then((existing) {
        if (!existing) {
          DatabaseHelper.internal().insertInToDB(toMapDB(), "$tablename");
        } else {
          print("logintoken already exists");
          var query =
              "UPDATE '$tablename' SET token = '$token' WHERE username = '$username'";
          DatabaseHelper.internal().executeQuery(db, query);
        }
        });
    });
  }

  @override
  String toString() {
    return "{username: $username, token: $token, created: $created}";
  }

  static Future<List<LoginToken>> fetch() async {
    var recordList =
        await DatabaseHelper.internal().retrieveFromDB("$tablename", null);
    List<LoginToken> itemList = [];
    if (recordList.isNotEmpty) {
      recordList.forEach((m) {
        LoginToken item = LoginToken.fromMap(m);
          itemList.add(item);
      });
    }
    return itemList;
  }



  static void createTable(Database db, int version) {
    var query =
        "CREATE TABLE '$tablename' ( username TEXT, token TEXT, created TEXT)";
    DatabaseHelper.internal().executeQuery(db, query);
    print("$className table created in $className.dart");
  }

//to check if an item exists in the table
  static Future<bool> isExisting(String code) async {
    int count = await getCount(code);
    if (count >= 1) {
      return true;
    } else {
      return false;
    }
  }

  static Future<int> getCount(String codePattern) async {
    Future<Database> db = DatabaseHelper.internal().db;
    var dbClient = await db;
    int count;
    String query;
    query =
        "SELECT COUNT(username) FROM '$tablename' WHERE username LIKE '$codePattern'";
    count = Sqflite.firstIntValue(await dbClient.rawQuery(query));
    print("Inside $className Count + $count");
    return count;
  }

 
  static Future<LoginToken> fetchByCode(String code) async {
    Future<Database> db = DatabaseHelper.internal().db;
    var dbClient = await db;
 
    LoginToken result;
    String query;
    query = "SELECT * FROM '$tablename' WHERE username = '$code'";
    result = (await dbClient.rawQuery(query)) as LoginToken;
    return result;
  }


  

}
