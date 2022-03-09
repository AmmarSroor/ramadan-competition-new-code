class TopPerson {
  String? username;
  String? firstName;
  String? lastName;
  String? profilePhoto;
  int? totalPoints;

  TopPerson({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.totalPoints,
  });

  TopPerson.fromJson(Map<String, dynamic> json)
  {
    username = json["username"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    profilePhoto = json["profile_photo"];
    totalPoints = json["total_points"];
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "first_name": firstName,
      "last_name": lastName,
      "profile_photo": profilePhoto,
      "total_points": totalPoints,
    };
  }
}
