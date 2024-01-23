// To parse this JSON data, do
//
//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) =>
    InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) =>
    json.encode(data.toJson());

class InformationModel {
  int? id;
  DateTime? dateN;
  String? numero;
  String? email;
  String? adresse;
  String? matricule;
  String? superviseur;
  DateTime? dateE;
  String? etatCivil;
  int? nombreE;
  String? niveauEtude;
  String? grade;
  String? fonction;
  String? sexe;
  String? direction;
  String? departement;
  String? service;
  String? nom;
  String? postnom;
  String? prenom;

  InformationModel({
    this.id,
    this.dateN,
    this.numero,
    this.email,
    this.adresse,
    this.matricule,
    this.superviseur,
    this.dateE,
    this.etatCivil,
    this.nombreE,
    this.niveauEtude,
    this.grade,
    this.fonction,
    this.sexe,
    this.direction,
    this.departement,
    this.service,
    this.nom,
    this.postnom,
    this.prenom,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        id: json["id"],
        dateN: json["date_n"] == null ? null : DateTime.parse(json["date_n"]),
        numero: json["numero"],
        email: json["email"],
        adresse: json["adresse"],
        matricule: json["matricule"],
        superviseur: json["superviseur"],
        dateE: json["date_e"] == null ? null : DateTime.parse(json["date_e"]),
        etatCivil: json["etat_civil"],
        nombreE: json["nombre_e"],
        niveauEtude: json["niveau_etude"],
        grade: json["grade"],
        fonction: json["fonction"],
        sexe: json["sexe"],
        direction: json["direction"],
        departement: json["departement"],
        service: json["service"],
        nom: json["nom"],
        postnom: json["postnom"],
        prenom: json["prenom"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_n": dateN?.toIso8601String(),
        "numero": numero,
        "email": email,
        "adresse": adresse,
        "matricule": matricule,
        "superviseur": superviseur,
        "date_e": dateE?.toIso8601String(),
        "etat_civil": etatCivil,
        "nombre_e": nombreE,
        "niveau_etude": niveauEtude,
        "grade": grade,
        "fonction": fonction,
        "sexe": sexe,
        "direction": direction,
        "departement": departement,
        "service": service,
        "nom": nom,
        "postnom": postnom,
        "prenom": prenom,
      };
}
