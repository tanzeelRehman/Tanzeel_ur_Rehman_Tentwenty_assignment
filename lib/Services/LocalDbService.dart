// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class LocalDbService {
//   static late Box box;
//   static Future openBox(String boxName) async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive.init(dir.path);
//     print("initilizing box");
//     box = await Hive.openBox(boxName);
//   }

//   static Future putData(Map<String, dynamic> map) async {
//     await box.clear();
//     List<dynamic> data = map["results"];
//     for (var element in data) {
//       box.add(element);
//     }
//   }

//   static getData() {
//     return box.toMap();
//   }
// }
