import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class ModelUtils {
  static Map boolMap(bool field, Map map, String mapName) {
    if (field != null) {
      if (field == true) {
        map[mapName] = "TRUE";
      } else {
        map[mapName] = "FALSE";
      }
    }
    return map;
  }

  static Map dateMap(DateTime field, Map map, String mapName) {
    if (field != null) {
      DateFormat df = DateFormat('yyyy-MM-dd');
      map[mapName] = df.format(field);
    }
    return map;
  }

  static Map dateTimeMap(DateTime field, Map map, String mapName) {
    if (field != null) {
      map[mapName] = field.toIso8601String();
    }
    return map;
  }

  static double mapDouble(Map map, String mapName) {
    double ret;
    if (map[mapName] != null) {
      dynamic vd = map[mapName];
      if (vd is int) {
        int vdi = map[mapName];
        ret = vdi.ceilToDouble();
      } else if (vd is double) {
        ret = map[mapName];
      } else if (vd is String) {
        String vds = map[mapName];
        ret = double.parse(vds);
      }
    }
    return ret;
  }

  static DateTime mapDate(Map map, String mapName) {
    DateTime ret;
    if (map[mapName] != null) {
      ret = DateTime.parse(map[mapName]);
    }
    return ret;
  }

  static DateTime mapDateTime(Map map, String mapName) {
    DateTime ret;
    if (map[mapName] != null) {
      ret = DateTime.parse(map[mapName]);
    }
    return ret;
  }

static String mapString(Map map, String mapName) {
  String ret;
  if (map[mapName] != null) {
 
      ret = map[mapName];
    }
    return ret;
}
static bool mapBool(Map map, String mapName) {
  bool ret;
  if (map[mapName] != null) {
      if (map[mapName] == "TRUE") {
        ret = true;
      } else {
        ret = false;
      }
    }
    return ret;
}

}
