class RegisterModel
{
  String? username;
  String? firstName;
  String? lastName;
  String? profilePhoto;
  int? totalPoints;
  String? competition;

  RegisterModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.totalPoints,
    required this.competition,
  });

  RegisterModel.fromJson(Map<String,dynamic>json)
  {
    username=json['username'];
    firstName=json['first_name'];
    lastName=json['last_name'];
    profilePhoto=json['profile_photo'];
    totalPoints=json['total_points'];
    competition=json['competition'];
  }

  Map<String,dynamic> toMap(){
    return {
      'username':username,
      'first_name':firstName,
      'last_name':lastName,
      'profile_photo':profilePhoto,
      'total_points':totalPoints,
      'competition':competition,
    };
  }
}