class Etudiant {
  int? idetudiant;
  String? codeetudiant;
  String? nometudiant;
  String? prenometudiant;
  String? telephoneetudiant;
  int? fraisetudiant;
  String? dateentreetudiant;

  Etudiant(
      this.idetudiant,
      this.codeetudiant,
      this.nometudiant,
      this.prenometudiant,
      this.telephoneetudiant,
      this.fraisetudiant,
      this.dateentreetudiant);

  Etudiant.map(dynamic obj) {
    idetudiant = obj['id_etudiant'];
    codeetudiant = obj['code_etudiant'];
    nometudiant = obj['nom_etudiant'];
    prenometudiant = obj['prenom_etudiant'];
    telephoneetudiant = obj['telephone_etudiant'];
    fraisetudiant = obj['frais_etudiant'];
    dateentreetudiant = obj['date_entre_etudiant'];
  }

  int get idEtudiant => idetudiant!;
  String get codeEtudiant => codeetudiant!;
  String get nomEtudiant => nometudiant!;
  String get prenomEtudiant => prenometudiant!;
  String get telephoneEtudiant => telephoneetudiant!;
  int get fraisEtudiant => fraisetudiant!;
  String get dateEntreEtudiant => dateentreetudiant!;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    //map['id'] = _id;
    map['code_etudiant'] = codeetudiant;
    map['nom_etudiant'] = nometudiant;
    map['prenom_etudiant'] = prenometudiant;
    map['telephone_etudiant'] = telephoneetudiant;
    map['frais_etudiant'] = fraisetudiant;
    map['date_entre_etudiant'] = dateentreetudiant;
    return map;
  }

  Etudiant.fromMap(Map<String, dynamic> map) {
    //  _id = map['id'];
    codeetudiant = map['code_etudiant'];
    nometudiant = map['nom_etudiant'];
    prenometudiant = map['prenom_etudiant'];
    telephoneetudiant = map['telephone_etudiant'];
    fraisetudiant = map['frais_etudiant'];
    dateentreetudiant = map['date_entre_etudiant'];
  }
}
