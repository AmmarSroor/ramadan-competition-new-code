class PointRecordsModel {

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  PointRecordsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  PointRecordsModel.fromJson(Map<String, dynamic> json){
    count=json["count"];
    next=json["next"];
    previous=json["previous"];
    results=List<Result>.from(json["results"].map((x) => Result.fromJson(x)));
  }

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results!.map((x) => x.toMap())),
  };
}

class Result {

  String? id;
  String? name;

  Result({
    required this.id,
    required this.name,
  });

  Result.fromJson(Map<String, dynamic> json){
    id=json["id"];
    name=json["name"];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
