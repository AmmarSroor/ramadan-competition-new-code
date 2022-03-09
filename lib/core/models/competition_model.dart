import 'dart:convert';
class CompetitionModel {

  String? id;
  String? name;

  CompetitionModel({
    required this.id,
    required this.name,
  });

  CompetitionModel.fromJson(Map<String, dynamic> json){
    id= json["id"];
    name= json["name"];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}

List<CompetitionModel> competitionFromJson(String str) {
  return List<CompetitionModel>.from(json.decode(str).map((x) {
    return CompetitionModel.fromJson(x);
  }));
}