class LoginModel
{
  String? username;
  String? firstName;
  String? lastName;
  String? profilePhoto;

  LoginModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  LoginModel.fromJson(Map<String,dynamic>json)
  {
    username=json['username'];
    firstName=json['first_name'];
    lastName=json['last_name'];
    profilePhoto=json['profile_photo'];
  }

  Map<String,dynamic> toMap(){
    return {
      'username':username,
      'first_name':firstName,
      'last_name':lastName,
      'profile_photo':profilePhoto,
    };
  }
}