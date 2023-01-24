import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

///Call Init hive in your dart main file
///Also remember to open required box.
Future<void> initHive() async {
  final appDocumentDirectory =
      await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
 await HiveService.openBox('userName');
 await HiveService.openBox('email');
 await HiveService.openBox('dob');
}

///Hive utils.
class HiveService {
  static Future<Box<dynamic>> openBox(String value) async {
    return Hive.openBox(value);
  }

  static Future<void> registerAdapter<T>(
    TypeAdapter<T> adapter, {
    bool internal = false,
    bool override = false,
  }) async {
    return Hive.registerAdapter(
      adapter,
      internal: internal,
      override: override,
    );
  }

  ///[putData] of any type[object] into the specified box, using a key.
  Future putData(
    String boxName, {
    required String key,
    dynamic value,
  }) =>
      Hive.box(boxName).put(key, value);

  ///[getData] from the specified box, using a key.
  dynamic getData(
    String boxName, {
    required String key,
    dynamic defaultValue,
  }) =>
      Hive.box(boxName).get(key, defaultValue: defaultValue);

  ///[deleteData] from the specified box, using a key.
  Future deleteData(
    String boxName, {
    required String key,
  }) =>
      Hive.box(boxName).delete(key);

  ///[deleteDatas] from the specified box, using list of keys.
  Future deleteDatas(
    String boxName, {
    required List<String> keys,
  }) =>
      Hive.box(boxName).deleteAll(keys);

  ///.
  Future eraseHiveDB() => Hive.deleteFromDisk();
}
