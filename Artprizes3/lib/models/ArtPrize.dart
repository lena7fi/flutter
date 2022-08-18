import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../DatabaseHelper.dart';

part 'ArtPrize.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtPrize {
  //{"id":292,"title":"Incinerator Art Prize","country":"Australia","state":"VIC","city":null,"close_date":"2020-05-11T00:00:00","ExhibitionStartDate":"2020-08-29T00:00:00","ExhibitionEndDate":"2020-11-01T00:00:00","ApplicationsStartDate":"2020-04-07T00:00:00","prize_type":"General","prize_logo":null,"sponsored_start_date":"2020-04-14T00:00:00","sponsored_end_date":"2020-05-18T00:00:00","sponsored":true,"hidden":false,"watched":false,"IntendedToEnter":false,"Currency":"AUD $","PrizeAmount":14000,"Location":"VIC, Australia","State":"VIC","Country":"Australia","ViewCount":135,"FollowCount":83,"IntentToEnterCount":17,"eligibility":"National Entries"}

  static String className = "ArtPrize";
  static String tablename = className.toLowerCase();

  String uuid;
  String created =
      DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now().toUtc()) +
          ".${DateTime.now().toUtc().millisecond}";
  int id;
  bool live = false;
  String title;
  String country;
  String state;
  String city;
  String close_date;
  DateTime ExhibitionStartDate;
  DateTime ExhibitionEndDate;
  DateTime ApplicationsStartDate;
  String prize_type;
  String prize_logo;
  DateTime sponsored_start_date;
  DateTime sponsored_end_date;
  bool sponsored;
  bool hidden;
  bool watched;
  bool IntendedToEnter;
  String Currency;
  int PrizeAmount;
  String Location;
  String State;
  String Country;
  int ViewCount;
  int FollowCount;
  int IntentToEnterCount;
  String eligibility;

  //ArtPrizeconstructor
  ArtPrize();

  factory ArtPrize.fromJson(Map<String, dynamic> json) =>
      _$ArtPrizeFromJson(json);
  Map<String, dynamic> toJson() => _$ArtPrizeToJson(this);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['live'] = this.live;
    map['created'] = this.created;
    map['id'] = this.id;
    map['title'] = this.title;
    map['country'] = this.country;
    map['state'] = this.state;
    map['city'] = this.city;
    map['close_date'] = this.close_date;
    if (this.ExhibitionStartDate != null) {
      map['ExhibitionStartDate'] = ExhibitionStartDate.toIso8601String();
    }
    if (this.ExhibitionEndDate != null) {
      map['ExhibitionEndDate'] = ExhibitionEndDate.toIso8601String();
    }
    if (this.ApplicationsStartDate != null) {
      map['ApplicationsStartDate'] = ApplicationsStartDate.toIso8601String();
    }

    map['prize_type'] = this.prize_type;
    map['prize_logo'] = this.prize_logo;
    if (this.sponsored_start_date != null) {
      map['sponsored_start_date'] = sponsored_start_date.toIso8601String();
    }
    if (this.sponsored_end_date != null) {
      map['sponsored_end_date'] = sponsored_end_date.toIso8601String();
    }

    map['sponsored'] = this.sponsored;

    map['hidden'] = this.hidden;
    map['watched'] = this.watched;
    map['IntendedToEnter'] = this.IntendedToEnter;
    map['Currency'] = this.Currency;
    map['PrizeAmount'] = this.PrizeAmount;
    map['Location'] = this.Location;
    map['ViewCount'] = this.ViewCount;
    map['FollowCount'] = this.FollowCount;
    map['IntentToEnterCount'] = this.IntentToEnterCount;
    map['eligibility'] = this.eligibility;
    return map;
  }

  Map<String, dynamic> toMapDB() {
    var map = Map<String, dynamic>();

//map['uuid'] = tokenData['sub'];
   if (this.live != null) {
      if (this.live == true) {
        map['live'] = "TRUE";
      } else {
        map['live'] = "FALSE";
      }
    }
    map['created'] = this.created;
    map['id'] = this.id;
    map['title'] = this.title;
    map['country'] = this.country;
    map['state'] = this.state;
    map['city'] = this.city;
    map['close_date'] = this.close_date;
    if (this.ExhibitionStartDate != null) {
      map['ExhibitionStartDate'] = ExhibitionStartDate.toIso8601String();
    }
    if (this.ExhibitionEndDate != null) {
      map['ExhibitionEndDate'] = ExhibitionEndDate.toIso8601String();
    }
    if (this.ApplicationsStartDate != null) {
      map['ApplicationsStartDate'] = ApplicationsStartDate.toIso8601String();
    }
    map['prize_type'] = this.prize_type;
    map['prize_logo'] = this.prize_logo;

    if (this.sponsored_start_date != null) {
      map['sponsored_start_date'] = sponsored_start_date.toIso8601String();
    }
    if (this.sponsored_end_date != null) {
      map['sponsored_end_date'] = sponsored_end_date.toIso8601String();
    }
    if (this.sponsored != null) {
      if (this.sponsored == true) {
        map['sponsored'] = "TRUE";
      } else {
        map['sponsored'] = "FALSE";
      }
    }
    if (this.hidden != null) {
      if (this.hidden == true) {
        map['hidden'] = "TRUE";
      } else {
        map['hidden'] = "FALSE";
      }
    }

    if (this.watched != null) {
      if (this.watched == true) {
        map['watched'] = "TRUE";
      } else {
        map['watched'] = "FALSE";
      }
    }
    if (this.IntendedToEnter != null) {
      if (this.IntendedToEnter == true) {
        map['IntendedToEnter'] = "TRUE";
      } else {
        map['IntendedToEnter'] = "FALSE";
      }
    }

    map['Currency'] = this.Currency;
    map['PrizeAmount'] = this.PrizeAmount;
    map['Location'] = this.Location;
    map['ViewCount'] = this.ViewCount;
    map['FollowCount'] = this.FollowCount;
    map['IntentToEnterCount'] = this.IntentToEnterCount;
    map['eligibility'] = this.eligibility;
    return map;
  }

  ArtPrize.fromMap(Map<String, dynamic> map) {
    this.created = map['created'];
    this.id = map['id'];
    this.title = map['title'];
    this.country = map['country'];
    this.state = map['state'];
    this.city = map['city'];
    this.close_date = map['close_date'];
    if (map["ExhibitionStartDate"] != null) {
      this.ExhibitionStartDate = DateTime.parse(map["ExhibitionStartDate"]);
    }
    if (map["ExhibitionEndDate"] != null) {
      this.ExhibitionEndDate = DateTime.parse(map["ExhibitionEndDate"]);
    }
    if (map["ApplicationsStartDate"] != null) {
      this.ApplicationsStartDate = DateTime.parse(map["ApplicationsStartDate"]);
    }

    this.prize_type = map['prize_type'];
    this.prize_logo = map['prize_logo'];
    if (map["sponsored_start_date"] != null) {
      this.sponsored_start_date = DateTime.parse(map["sponsored_start_date"]);
    }
    if (map["sponsored_end_date"] != null) {
      this.sponsored_end_date = DateTime.parse(map["sponsored_end_date"]);
    }
    this.sponsored = map['sponsored'];
    this.hidden = map['hidden'];
    this.watched = map['watched'];
    this.IntendedToEnter = map['IntendedToEnter'];
    this.Currency = map['Currency'];
    this.PrizeAmount = map['PrizeAmount'];
    this.Location = map['Location'];
    this.ViewCount = map['ViewCount'];
    this.FollowCount = map['FollowCount'];
    this.IntentToEnterCount = map['IntentToEnterCount'];
    this.eligibility = map['eligibility'];
  }

  ArtPrize.fromMapDB(Map<String, dynamic> map) {
     if (map['live'] != null) {
      if (map['live'] == 'TRUE') {
        this.live = true;
      } else {
        this.live = false;
      }
    } else {
      this.live = false;
    }
    this.created = map['created'];
    this.id = map['id'];
    this.title = map['title'];
    this.country = map['country'];
    this.state = map['state'];
    this.city = map['city'];
    this.close_date = map['close_date'];
    if (map["ExhibitionStartDate"] != null) {
      this.ExhibitionStartDate = DateTime.parse(map["ExhibitionStartDate"]);
    }
    if (map["ExhibitionEndDate"] != null) {
      this.ExhibitionEndDate = DateTime.parse(map["ExhibitionEndDate"]);
    }
    if (map["ApplicationsStartDate"] != null) {
      this.ApplicationsStartDate = DateTime.parse(map["ApplicationsStartDate"]);
    }
    this.prize_type = map['prize_type'];
    this.prize_logo = map['prize_logo'];
    if (map["sponsored_start_date"] != null) {
      this.sponsored_start_date = DateTime.parse(map["sponsored_start_date"]);
    }
    if (map["sponsored_end_date"] != null) {
      this.sponsored_end_date = DateTime.parse(map["sponsored_end_date"]);
    }
    if (map['sponsored'] != null) {
      if (map['sponsored'] == 'TRUE') {
        this.sponsored = true;
      } else {
        this.sponsored = false;
      }
    } else {
      this.sponsored = false;
    }

    if (map['hidden'] != null) {
      if (map['hidden'] == 'TRUE') {
        this.hidden = true;
      } else {
        this.hidden = false;
      }
    } else {
      this.hidden = false;
    }

    if (map['watched'] != null) {
      if (map['watched'] == 'TRUE') {
        this.watched = true;
      } else {
        this.watched = false;
      }
    } else {
      this.watched = false;
    }

    if (map['IntendedToEnter'] != null) {
      if (map['IntendedToEnter'] == 'TRUE') {
        this.IntendedToEnter = true;
      } else {
        this.IntendedToEnter = false;
      }
    } else {
      this.IntendedToEnter = false;
    }

    this.Currency = map['Currency'];
    this.PrizeAmount = map['PrizeAmount'];
    this.Location = map['Location'];
    this.ViewCount = map['ViewCount'];
    this.FollowCount = map['FollowCount'];
    this.IntentToEnterCount = map['IntentToEnterCount'];
    this.eligibility = map['eligibility'];
  }

//saving artprizes into the db
  persist() async {
    DatabaseHelper.internal().db.then((db) {
      // print("In save $tablename");
      isExisting(this.id).then((existing) {
        if (!existing) {
          print("${this.title} being saved for first time");
          DatabaseHelper.instance.insertInToDB(toMapDB(), "$tablename");
        } else {
          print("${this.title} already exists");
          var query =
              "UPDATE '$tablename' SET ExhibitionStartDate = '$ExhibitionStartDate' WHERE id = $id";
          DatabaseHelper.internal().executeQuery(db, query);
        }
      });
    });
  }

  @override
  String toString() {
    return "{id: $id, title: $title,}";
  }

  static ArtPrize convertFromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    var object = ArtPrize.fromMap(jsonMap);
    return object;
  }

  static Future<List<ArtPrize>> fetchAll() async {
    var recordList =
        await DatabaseHelper.instance.retrieveFromDB("$tablename", null);
    List<ArtPrize> itemList = [];
    if (recordList.isNotEmpty) {
      recordList.forEach((m) {
        ArtPrize item = ArtPrize.fromMap(m);
        itemList.add(item);
      });
    }
    return itemList;
  }

  static void createTable(Database db, int version) {
    var query =
        "CREATE TABLE '$tablename' (live TEXT,created TEXT,id INT,title TEXT,country TEXT,state TEXT,city TEXT,close_date TEXT,ExhibitionStartDate TEXT,ExhibitionEndDate TEXT,ApplicationsStartDate TEXT,prize_type TEXT,prize_logo TEXT,sponsored_start_date TEXT,sponsored_end_date TEXT,sponsored TEXT,hidden TEXT,watched TEXT,IntendedToEnter TEXT,Currency TEXT,PrizeAmount INT,Location TEXT,ViewCount INT, FollowCount INT, IntentToEnterCount INT,eligibility TEXT)";

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
    var dbClient = await db;
    int count;
    String query;
    query = "SELECT COUNT(id) FROM '$tablename' WHERE id = $id";
    count = Sqflite.firstIntValue(await dbClient.rawQuery(query));
    // print("Inside $className Count + $count");
    return count;
  }

  static Future<ArtPrize> fetchById(String id) async {
    Future<Database> db = DatabaseHelper.internal().db;
    var dbClient = await db;

    ArtPrize result;
    String query;
    query = "SELECT * FROM '$tablename' WHERE id = '$id'";
    result = (await dbClient.rawQuery(query)) as ArtPrize;
    return result;
  }
}
