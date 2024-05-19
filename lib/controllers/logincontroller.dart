import 'package:get/get.dart';

import '../models/utilisateur.dart';
import '../services/dbhelper.dart';

var db = DatabaseHelper();

class LoginController extends GetxController {
  String? login;
  String? welcomeString;

  Future<bool?> isExist(String loginloc, String pass) async {
    bool? ret = await db.isExistLogin(loginloc, pass);
    if (ret == true) {
      welcomeString = "";
      login = loginloc;
      update();
    }
    return ret;
  }

  Future<Utilisateur?> getUtilisateurByLogin(String login) async {
    Utilisateur? ret = await db.getUtilisateurByLogin(login);
    return ret;
  }

  void welcomeUser() {
    welcomeString = "Incorrect !";
    update();
  }

  @override
  void onInit() {
    login = "";
    welcomeString = "";
    super.onInit();
  }
}
