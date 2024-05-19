import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../models/utilisateur.dart';

class DatabaseHelper {
  static const newDbVersion = 8;
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "ri9abe.db");

    var oldDb = await openDatabase(path);
    int curVersion = await oldDb.getVersion();
    if (curVersion < newDbVersion) {
      oldDb.close();
      await deleteDatabase(path);
    }
    // print("Current version :$curVersion");
    var ourDb =
        await openDatabase(path, version: newDbVersion, onCreate: _onCreate);
    ourDb.setVersion(newDbVersion);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE utilisateurs (id_utilisateur INTEGER PRIMARY KEY AUTOINCREMENT, login_utilisateur TEXT, password_utilisateur TEXT, nom_utilisateur TEXT, code_groupe TEXT)");
    await db.execute(
        "INSERT INTO utilisateurs (id_utilisateur, login_utilisateur, password_utilisateur, nom_utilisateur, code_groupe) VALUES (1, 'mouhamedou', 'mouhamedou','mouhamedou','admin')");
    await db.execute(
        "CREATE TABLE groupes (id_groupe INTEGER PRIMARY KEY AUTOINCREMENT, code_groupe TEXT, nom_groupe TEXT)");

    await db.execute(
        "INSERT INTO groupes (id_groupe, code_groupe, nom_groupe) VALUES (1, 'admin', 'admin')");

    await db.execute(
        "CREATE TABLE etudiants (id_etudiant INTEGER PRIMARY KEY AUTOINCREMENT,code_etudiant TEXT, nom_etudiant TEXT, prenom_etudiant TEXT,telephone_etudiant TEXT,  frais_etudiant INTEGER, date_entre_etudiant TEXT)");
  }

  Future<bool?> isExistLogin(String login, String password) async {
    var dbClient = await db;
    if (dbClient != null) {
      var result = await dbClient.rawQuery(
          "SELECT * FROM utilisateurs WHERE login_utilisateur = '$login' AND password_utilisateur = '$password'");
      if (result.isEmpty) {
        return false;
      }
      return true;
    }
    return null;
  }

  Future<Utilisateur?> getUtilisateurByLogin(String login) async {
    var dbClient = await db;
    if (dbClient != null) {
      var result = await dbClient.rawQuery(
          "SELECT * FROM utilisateurs WHERE login_utilisateur ='$login'");
      if (result.isEmpty) {
        return null;
      }
      return Utilisateur.fromMap(result.first);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getEtudiants() async {
    var dbClient = await db;
    if (dbClient != null) {
      var result = await dbClient.rawQuery("SELECT * FROM etudiants");
      return result.toList();
    }
    return null;
  }
}
