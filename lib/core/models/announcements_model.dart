class AnnouncementsModel {

  Groups? announcements;

  AnnouncementsModel({
    required this.announcements,
  });

  AnnouncementsModel.fromJson(Map<String, dynamic> json){
    announcements=Groups.fromJson(json["announcements"]);
  }

  Map<String, dynamic> toMap() => {
    "announcements": announcements!.toMap(),
  };
}

class Groups {
  List<String>? group2;
  List<String>? g3StealOtherGroupsSStS;
  List<String>? group4;
  List<String>? group5;
  List<String>? group6;
  List<String>? group1;
  List<String>? comp;
  Groups({
    this.group2,
    this.g3StealOtherGroupsSStS,
    this.group4,
    this.group5,
    this.group6,
    this.group1,
    this.comp,
  });

  Groups.fromJson(Map<String, dynamic> json){
    group2= List<String>.from(json["Group 2"].map((x) => x));
    g3StealOtherGroupsSStS= List<String>.from(json["G3-stealOtherGroups'sSt.(s)"].map((x) => x));
    group4= List<String>.from(json["Group 4"].map((x) => x));
    group5= List<String>.from(json["Group 5"].map((x) => x));
    group6= List<String>.from(json["Group 6"].map((x) => x));
    group1= List<String>.from(json["Group 1"].map((x) => x));
    comp= List<String>.from(json["comp"].map((x) => x));
  }

  Map<String, dynamic> toMap() => {
    "Group 2": List<dynamic>.from(group2!.map((x) => x)),
    "G3-stealOtherGroups'sSt.(s)": List<dynamic>.from(g3StealOtherGroupsSStS!.map((x) => x)),
    "Group 4": List<dynamic>.from(group4!.map((x) => x)),
    "Group 5": List<dynamic>.from(group5!.map((x) => x)),
    "Group 6": List<dynamic>.from(group6!.map((x) => x)),
    "Group 1": List<dynamic>.from(group1!.map((x) => x)),
    "comp": List<dynamic>.from(comp!.map((x) => x)),
  };
}
