import 'dart:convert';

import 'package:artprizes3/utils/Sync.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../DatabaseHelper.dart';
import 'ModelUtils.dart';

part 'Advertisment.g.dart';

@JsonSerializable(explicitToJson: true)
class Advertisment {
//   id: 372,
// name: "Western Sydney University Sculpture Award and Exhibition",
// created: "2019-06-11T15:11:00",
// Code: "WesternSydney_2019",
// Image: "images/advertisements/UWS_2020 Sculpture Awards_Call.jpg",
// updated: null,
// active: true,
// url: "http://virtualtours.westernsydney.edu.au/sculpture-award",
// showOnMobile: true,
// mobileBGColor: "ffffff",
// mobileTextColour: "000000",
// artprize_id: null,
// advert_artwork: null,
// fromDate: null,
// toDate: null,
// category: null,
// prizeid: 335,
// ExhibitionBannerImage: "images/advertisements/art-work/UWS_2020 exhibition banner artrizes.jpg",
// PrizeBannerImage: "images/advertisements/art-work/banner_UWS_2020 Sculpture Awards_Callbanner.jpg",
// ExhibitionBannerDateFrom: "2020-05-01T00:00:00",
// ExhibitionBannerDateTo: "2020-05-31T00:00:00"
  static String className = "Advertisment";
  static String tablename = className.toLowerCase();

  String uuid;
  int id;
  String name;
  DateTime created;
  String Code; // Code
  String Image; //Image
  DateTime updated;
  bool active;
  String url;
  bool showOnMobile;
  String mobileBGColor;
  String mobileTextColour;
  int artprize_id;
  String advert_artwork;
  DateTime fromDate;
  DateTime toDate;
  String category;
  int prizeid;
  String ExhibitionBannerImage;
  String PrizeBannerImage;
  DateTime ExhibitionBannerDateFrom;
  DateTime ExhibitionBannerDateTo;

  //Advertisment constructor
  Advertisment();

  factory Advertisment.fromJson(Map<String, dynamic> json) =>
      _$AdvertismentFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertismentToJson(this);
 
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = this.id;
    map['name'] = this.name;
    ModelUtils.dateTimeMap(this.created, map, "created");
    map['Code'] = this.Code; // Code
    map['Image'] = this.Image; //Image
    ModelUtils.dateTimeMap(this.updated, map, "updated");
    map['active'] = this.active;
    map['url'] = this.url;
    map['showOnMobile'] = this.showOnMobile;
    map['mobileBGColor'] = this.mobileBGColor;
    map['mobileTextColour'] = this.mobileTextColour;
    map['artprize_id'] = this.artprize_id;
    map['advert_artwork'] = this.advert_artwork;
    ModelUtils.dateTimeMap(this.fromDate, map, "fromDate");
    ModelUtils.dateTimeMap(this.toDate, map, "toDate");

    map['category'] = this.category;
    map['prizeid'] = this.prizeid;
    map['ExhibitionBannerImage'] = this.ExhibitionBannerImage;
    map['PrizeBannerImage'] = this.PrizeBannerImage;

    ModelUtils.dateMap(
        this.ExhibitionBannerDateFrom, map, "ExhibitionBannerDateFrom");
    ModelUtils.dateMap(
        this.ExhibitionBannerDateTo, map, "ExhibitionBannerDateTo");
    return map;
  }

  Map<String, dynamic> toMapDB() {
    var map = Map<String, dynamic>();
    map['uuid'] = Sync.username;
    map['id'] = this.id;
    map['name'] = this.name;
    ModelUtils.dateTimeMap(this.created, map, "created");
    map['Code'] = this.Code; // Code
    map['Image'] = this.Image; //Image
    ModelUtils.dateTimeMap(this.updated, map, "updated");
    ModelUtils.boolMap(this.active, map, "active");
    map['url'] = this.url;
    ModelUtils.boolMap(this.showOnMobile, map, "showOnMobile");
    map['mobileBGColor'] = this.mobileBGColor;
    map['mobileTextColour'] = this.mobileTextColour;
    map['artprize_id'] = this.artprize_id;
    map['advert_artwork'] = this.advert_artwork;
    ModelUtils.dateTimeMap(this.fromDate, map, "fromDate");
    ModelUtils.dateTimeMap(this.toDate, map, "toDate");

    map['category'] = this.category;
    map['prizeid'] = this.prizeid;
    map['ExhibitionBannerImage'] = this.ExhibitionBannerImage;
    map['PrizeBannerImage'] = this.PrizeBannerImage;

    ModelUtils.dateMap(
        this.ExhibitionBannerDateFrom, map, "ExhibitionBannerDateFrom");
    ModelUtils.dateMap(
        this.ExhibitionBannerDateTo, map, "ExhibitionBannerDateTo");
    return map;
  }

  Advertisment.fromMapDB(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];

    this.created = ModelUtils.mapDateTime(map, "created");
    this.Code = map['Code']; // Code
    this.Image = map['Image']; //Image

    this.updated = ModelUtils.mapDateTime(map, "updated");

    this.active = ModelUtils.mapBool(map, "active");
    this.url = map['url'];
    this.showOnMobile = ModelUtils.mapBool(map, "showOnMobile");

    this.mobileBGColor = map['mobileBGColor'];
    this.mobileTextColour = map['mobileTextColour'];
    this.artprize_id = map['artprize_id'];
    this.advert_artwork = map['advert_artwork'];

    this.fromDate = ModelUtils.mapDate(map, "fromDate");
    this.toDate = ModelUtils.mapDate(map, "toDate");

    this.category = map['category'];
    this.prizeid = map['prizeid'];
    this.ExhibitionBannerImage = map['ExhibitionBannerImage'];
    this.PrizeBannerImage = map['PrizeBannerImage'];
    this.ExhibitionBannerDateFrom =
        ModelUtils.mapDateTime(map, "ExhibitionBannerDateFrom");
    this.ExhibitionBannerDateTo =
        ModelUtils.mapDateTime(map, "ExhibitionBannerDateTo");
  }
 
  Advertisment.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];

    this.created = ModelUtils.mapDateTime(map, "created");
    this.Code = ModelUtils.mapString(map, "Code"); // Code
    this.Image = ModelUtils.mapString(map, "Image"); //Image
 
    this.updated = ModelUtils.mapDateTime(map, "updated");

    this.active = map['active'];
    this.url = map['url'];
    this.showOnMobile = map['showOnMobile'];

    this.mobileBGColor = map['mobileBGColor'];
    this.mobileTextColour = map['mobileTextColour'];
    this.artprize_id = map['artprize_id'];
    this.advert_artwork = map['advert_artwork'];

    this.fromDate = ModelUtils.mapDate(map, "fromDate");
    this.toDate = ModelUtils.mapDate(map, "toDate");

    this.category = map['category'];
    this.prizeid = map['prizeid'];
    this.ExhibitionBannerImage =  ModelUtils.mapString(map, 'ExhibitionBannerImage');
    this.PrizeBannerImage = ModelUtils.mapString(map, 'PrizeBannerImage');
    this.ExhibitionBannerDateFrom =
        ModelUtils.mapDateTime(map, "ExhibitionBannerDateFrom");
    this.ExhibitionBannerDateTo =
        ModelUtils.mapDateTime(map, "ExhibitionBannerDateTo");
  }

//saving advertisments into the db
  persist() async {
    DatabaseHelper.internal().db.then((db) {
      // print("In save $tablename");
      isExisting(this.id).then((existing) {
        if (!existing) {
          print("${this.name} being saved for first time");
          DatabaseHelper.instance.insertInToDB(toMapDB(), "$tablename");
        } else {
          print("${this.name} already exists");
          var uid = Sync.username;
          var query =
              "UPDATE '$tablename' SET name = '$name' WHERE id = $id and uuid='$uid'";
          DatabaseHelper.internal().executeQuery(db, query);
        }
      });
    });
  }

  @override
  String toString() {
    return "{id: $id, name: $name,}";
  }

  static Advertisment convertFromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    var object = Advertisment.fromMap(jsonMap);
    return object;
  }

  static Future<List<Advertisment>> fetchAll() async {
    var recordList =
        await DatabaseHelper.instance.retrieveFromDB("$tablename", null);
    List<Advertisment> itemList = [];
    if (recordList.isNotEmpty) {
      recordList.forEach((m) {
        Advertisment item = Advertisment.fromMap(m);
        itemList.add(item);
      });
    }
    return itemList;
  }

  static void createTable(Database db, int version) {
    var query =
        "CREATE TABLE '$tablename' (uuid TEXT, id INT ,name TEXT,created TEXT,code TEXT,image TEXT,updated TEXT,active TEXT,url TEXT,showOnMobile TEXT,mobileBGColor TEXT,mobileTextColour TEXT,artprize_id INT,advert_artwork TEXT,fromDate TEXT,toDate TEXT,category TEXT,prizeid INT,ExhibitionBannerImage TEXT,PrizeBannerImage TEXT,ExhibitionBannerDateFrom TEXT,ExhibitionBannerDateTo TEXT , unique (uuid,id))";

    DatabaseHelper.internal().executeQuery(db, query);
    print("$className table created in $className.dart");
  }

//to check if an item exists in the table
  static Future<bool> isExisting(int id) async {
    int count = await getCount(id);
    if (count >= 1) {
      return true;
    } else {
      return false;
    }
  } 

  static Future<int> getCount(int id) async {
    Future<Database> db = DatabaseHelper.internal().db;
    var uid = Sync.username;

    var dbClient = await db;
    int count;
    String query;
    query = "SELECT COUNT(id) FROM '$tablename' WHERE id = $id and uuid='$uid'";
    count = Sqflite.firstIntValue(await dbClient.rawQuery(query));
    // print("Inside $className Count + $count");
    return count;
  }

  static Future<Advertisment> fetchById(String id) async {
    Future<Database> db = DatabaseHelper.internal().db;
    var uid = Sync.username;
    var dbClient = await db;

    Advertisment result;
    String query;
    query = "SELECT * FROM '$tablename' WHERE id = '$id' and uuid='$uid'";
    result = (await dbClient.rawQuery(query)) as Advertisment;
    return result;
  }
}
