class Utilisateur {
  int? idutilisateur;
  String? loginutilisateur;
  String? passwordutilisateur;
  String? nomutilisateur;
  String? codegroupe;

  Utilisateur(this.idutilisateur, this.loginutilisateur,
      this.passwordutilisateur, this.nomutilisateur, this.codegroupe);

  Utilisateur.map(dynamic obj) {
    idutilisateur = obj['id_utilisateur'];
    loginutilisateur = obj['login_utilisateur'];
    passwordutilisateur = obj['password_utilisateur'];
    nomutilisateur = obj['nom_utilisateur'];
    codegroupe = obj['code_groupe'];
  }

  int get idUtilisateur => idutilisateur!;
  String get loginUtilisateur => loginutilisateur!;
  String get passwordUtilisateur => passwordutilisateur!;
  String get nomUtilisateur => nomutilisateur!;
  String get codeGroupe => codegroupe!;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    //map['id'] = _id;
    map['login_utilisateur'] = loginutilisateur;
    map['password_utilisateur'] = passwordutilisateur;
    map['nom_utilisateur'] = nomutilisateur;
    map['code_groupe'] = codegroupe;
    return map;
  }

  Utilisateur.fromMap(Map<String, dynamic> map) {
    // this._id = map['id'];
    loginutilisateur = map['login_utilisateur'];
    passwordutilisateur = map['password_utilisateur'];
    nomutilisateur = map['nom_utilisateur'];
    codegroupe = map['code_groupe'];
  }
}
