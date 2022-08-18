import 'dart:convert';

import 'package:artprizes3/models/Advertisment.dart';
import 'package:artprizes3/models/ArtPrize.dart';
import 'package:artprizes3/models/LoginToken.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../DatabaseHelper.dart';
import '../ProjectEnv.dart';

class Sync {
  static var username = "adamCrow";
  static var password = "adamCrow01";

  static var token;

  Sync() {
    doSync().whenComplete(() => null);
  }

  Future<void> doSync() async {
    _doSync();
    print("token = $token");
  }

  _doSync() async {
    // set up POST request arguments
    String url = ProjectEnv.loginUrl + "/$username/$password";
    // make POST request
    print("Login test");
    var statusCode = await getHTTP(url);

    print("Login Test Status Code =  $statusCode");

// fetch lots of data

    url = ProjectEnv.getAllHiddenPrizesUrl + "/$token";
    print("Fetching lots of data with $url");
    await postDataHTTP(url, false);
    DatabaseHelper.internal().db.then((db) {
      var query = "UPDATE artprize SET live = 'FALSE'";
      DatabaseHelper.internal().executeQuery(db, query);
    });
    url = ProjectEnv.getAllVisiblePrizesUrl + "/$token";
    print("Fetching lots of data that is LIVE with $url");
    await getDataHTTP(url, true);

    url = ProjectEnv.getAllAdvertsUrl + "/$token";
    await getData2HTTP(url);
  }

  Future<String> getHTTP(
    url,
  ) async {
    var response = await http.get(url, headers: {
      // 'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Content Length= $response.contentLength");
      print(response.headers);
      print(response.request);
      print(response.body);

      LoginToken loginToken = LoginToken.convertFromJson(response.body);
      loginToken.persist();
      token = loginToken.token;

      return (response.statusCode.toString());
    } else {
      print("No response from backend  server");
      return (null);
    }
  }

  Future<String> getDataHTTP(url, live) async {
    var response = await http.get(url, headers: {
      // 'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Content Length= $response.contentLength");
      print(response.headers);
      print(response.request);
      //  print(response.body);

      List<ArtPrize> artprizes;

      artprizes = (json.decode(response.body) as List)
          .map((i) => ArtPrize.fromJson(i))
          .toList();
      int i = 0;
      for (ArtPrize ap in artprizes) {
        // print(i.toString() + " $ap");
        ap.live = live;
        await ap.persist();
        i++;
      }

      print("Number of ArtPrizes loaded = ${artprizes.length}");

      return (response.statusCode.toString());
    } else {
      print("No response from backend  server");
      return (null);
    }
  }

  Future<String> postDataHTTP(url, live) async {
    var response = await http.post(url, headers: {
      // 'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Content Length= $response.contentLength");
      print(response.headers);
      print(response.request);
      //  print(response.body);

      List<ArtPrize> artprizes;

      artprizes = (json.decode(response.body) as List)
          .map((i) => ArtPrize.fromJson(i))
          .toList();
      int i = 0;
      for (ArtPrize ap in artprizes) {
        print(i.toString() + " $ap");
        ap.live = live;
        await ap.persist();
        i++;
      }

      print("Number of ArtPrizes loaded = ${artprizes.length}");

      return (response.statusCode.toString());
    } else {
      print("No response from backend  server");
      return (null);
    }
  }

  Future<String> getData2HTTP(url) async {
    var response = await http.get(url, headers: {
      // 'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Content Length= $response.contentLength");
      print(response.headers);
      print(response.request);
      //  print(response.body);

      List<Advertisment> advertisments;

      advertisments = (json.decode(response.body) as List)
          .map((i) => Advertisment.fromJson(i))
          .toList();
      int i = 0;
      for (Advertisment ap in advertisments) {
        print(i.toString() + " $ap");
        await ap.persist();
        i++;
      }

      print("Number of Advertisments loaded = ${advertisments.length}");

      return (response.statusCode.toString());
    } else {
      print("No response from backend  server");
      return (null);
    }
  }
}
