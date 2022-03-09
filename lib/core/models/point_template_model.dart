
import 'dart:convert';

List<PointTemplateModel> pointTemplateFromJson(String str) {
  return List<PointTemplateModel>.from(json.decode(str).map((x) {
    return PointTemplateModel.fromJson(x);
  }));
}

class PointTemplateModel {
  int? id;
  int? section;
  int? upperUnitsBound;
  int? lowerUnitsBound;
  bool? isActive;
  bool? isShown;
  String? label;
  String? customDays;
  String? description;
  String? formType;

  PointTemplateModel({
    required this.id,
    required this.section,
    required this.upperUnitsBound,
    required this.lowerUnitsBound,
    required this.label,
    required this.customDays,
    required this.description,
    required this.isActive,
    required this.isShown,
    required this.formType,
  });

  PointTemplateModel.fromJson(Map<String, dynamic> json){
    id= json["id"];
    section= json["section"];
    upperUnitsBound= json["upper_units_bound"];
    lowerUnitsBound= json["lower_units_bound"];
    label= json["label"];
    customDays= json["custom_days"];
    description= json["description"];
    isActive= json["is_active"];
    isShown= json["is_shown"];
    formType= json["form_type"];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "section": section,
    "upper_units_bound": upperUnitsBound,
    "lower_units_bound": lowerUnitsBound,
    "label": label,
    "custom_days": customDays,
    "description": description,
    "is_active": isActive,
    "is_shown": isShown,
    "form_type": formType,
  };
}