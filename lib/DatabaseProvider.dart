import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  Database _database;
  static const String _databaseName = 'test_database.db';

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    String databasePath = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(databasePath, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE user("
        "id INTEGER PRIMARY KEY, "
        "firstName TEXT, "
        "lastName TEXT,"
        "username TEXT)",
      );
    });
  }
}
