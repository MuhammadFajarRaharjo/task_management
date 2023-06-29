import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management/common/models/todo_model.dart';

import '../models/user_model.dart';

class DbHelper {
  final String _todo = "todos";
  final String _user = "user";
  final String _databaseName = "task_management";

  ///* QUERY CREATE TABLE TO DATABASE
  Future<void> createTables(sql.Database database) async {
    await database.execute(
      "CREATE TABLE $_todo("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "title STRING, description STRING, date STRING, startTime STRING,"
      "endTime STRING, remind STRING, repeat INTEGER, isComplete INTEGER)",
    );
    await database.execute(
      "CREATE TABLE $_user("
      "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, isVerivied INTEGER)",
    );
  }

  ///* CREATE TABLE IN DATABASE [_databaseName]
  Future<sql.Database> db() {
    return sql.openDatabase(
      _databaseName,
      version: 2,
      onCreate: (db, _) => createTables(db),
    );
  }

  ///* Create Todo to database [_databaseName]
  ///* return int id
  Future<int> createTodo(TodoModel todo) async {
    final db = await DbHelper().db();

    final id = await db.insert(
      _todo,
      todo.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  ///* Create User to database [_databaseName]
  ///* return int id
  Future<int> createUser(int isVerivied) async {
    final db = await DbHelper().db();
    final data = UserModel(id: 1, isVerivied: isVerivied);

    final id = await db.insert(
      _user,
      data.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  /// Get all user data in user table
  /// return list[UserModel]
  Future<List<UserModel>> getUsers() async {
    final db = await DbHelper().db();
    final maps = await db.query(_user, orderBy: 'id');
    return maps.map((map) => UserModel.fromMap(map)).toList();
  }

  /// Get all user data in todo table
  /// return list[TodoModel]
  Future<List<TodoModel>> getTodos() async {
    final db = await DbHelper().db();
    final maps = await db.query(_todo, orderBy: 'id');
    return maps.map((map) => TodoModel.fromMap(map)).toList();
  }

  /// Get user data in todo table
  /// from id
  /// return [TodoModel] if todo is exist
  /// retrun [debugPrint] if todo not found
  Future<TodoModel> getTodo(int id) async {
    final db = await DbHelper().db();
    try {
      final maps = await db.query(
        _todo,
        where: "id = ?",
        whereArgs: [id],
        limit: 1,
      );
      return TodoModel.fromMap(maps.first);
    } catch (e) {
      throw print;
    }
  }

  Future<int> updateTodo(TodoModel todo) async {
    final db = await DbHelper().db();
    // final data = {
    //   'id': todo.id,
    //   'title': todo.title,
    //   'description': todo.description,
    //   'isComplete': todo.isComplete,
    //   'date': todo.date,
    //   'startTime': todo.startTime,
    //   'endTime': todo.endTime,
    // };

    return await db.update(
      _todo,
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final db = await DbHelper().db();

    try {
      await db.delete(_todo, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Unable to delete $e");
    }
  }
}
