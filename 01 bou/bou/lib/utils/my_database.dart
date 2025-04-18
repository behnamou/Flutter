import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// sql database

Future<Database> initializeDatabase(String dbName) async {
  String path = join(await getDatabasesPath(), '$dbName.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
      ''');
    },
  );
}

Future<void> deleteDatabase(String dbName) async {
  String path = join(await getDatabasesPath(), '$dbName.db');
  await deleteDatabase(path);
}

Future<void> _insertUser(Database db, Map<String, dynamic> user) async {
  await db.insert(
    'users',
    user,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Map<String, dynamic> _userFormatting(int id, String name) {
  Map<String, dynamic> newUser = {
    'id': id,
    'name': name,
  };
  return newUser;
}

void addNewUserToDatabase(String dbName, int id, String name) async {
  Database db = await initializeDatabase(dbName);
  await _insertUser(db, _userFormatting(id, name));
}

Future<String> _getUsers(String dbName) async {
  String ans = '';
  Database db = await initializeDatabase(dbName);
  final List<Map<String, dynamic>> users = await db.query('users');
  for (var user in users) {
    ans += 'ID: ${user['id']} User: ${user['name']}\n';
  }
  return ans;
}

Future<String> getUsers(String dbName) async {
  String ans = await _getUsers(dbName);
  return ans;
}

Future<void> updateUser(String dbName, int id, String name) async {
  Database db = await initializeDatabase(dbName);
  await db.update(
    'users',
    {'name': name},
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<String> deleteUser(String dbName, int id) async {
  Database db = await initializeDatabase(dbName);

  List<Map<String, dynamic>> result = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );

  if (result.isNotEmpty) {
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    return 'User with ID $id deleted successfully.';
  } else {
    return 'User with ID $id not found!';
  }
}

Future<String> getUserById(String dbName, int id) async {
  Database db = await initializeDatabase(dbName);
  List<Map<String, dynamic>> result = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );

  if (result.isNotEmpty) {
    Map<String, dynamic> user = result.first;
    return 'ID: ${user['id']}, Name: ${user['name']}';
  } else {
    return 'User not found';
  }
}
