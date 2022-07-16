import 'package:mongo_dart/mongo_dart.dart';
import 'package:markdown_app/dbHelper/constants.dart';

class MongoDatabase {
  static connect() async {
    print("URL $MONGO_URL");
    var db = await Db.create(MONGO_URL);
    await db.open();
    print("Connection MADE!");
  }
}