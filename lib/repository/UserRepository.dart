import 'package:flutter_sqlite/DatabaseProvider.dart';
import 'package:flutter_sqlite/entities/UserEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class UserRepository extends DatabaseProvider {
  UserRepository._();

  static final UserRepository userRepository = UserRepository._();

  Future<void> insertUser(UserEntity userEntity) async {
    Database db = await database;

    await db.insert('user', userEntity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserEntity>> findAllUsers() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('user');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return UserEntity(
          id: maps[i]['id'],
          firstName: maps[i]['firstName'],
          lastName: maps[i]['lastName'],
          username: maps[i]['username']);
    });
  }
}
