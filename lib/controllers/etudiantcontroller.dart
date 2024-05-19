import 'package:get/get.dart';
import 'package:ri9abe/models/etudiant.dart';

import '../services/dbhelper.dart';

var db = DatabaseHelper();

class EtudiantController extends GetxController {
  int? nb;
  @override
  onInit() {
    nb = 0;
    super.onInit();
  }

  Future<List<Etudiant>> populateDb() async {
    List<Etudiant> res = [];
    await db.getEtudiants().then((rows) {
      for (var row in rows!) {
        res.add(Etudiant.fromMap(row));
      }
    });
    nb = res.length;
    update();
    return res;
  }
}
