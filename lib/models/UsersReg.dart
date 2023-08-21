class Users {
  // final int id;
  final String name;
  final String email;
  final String mobile;
  final String photourl;
  final String type;
  final String cat;
  final String ngoname;

  Users(
      {this.name,
      this.email,
      this.mobile,
      this.photourl,
      this.type,
      this.cat,
      this.ngoname});

  //factory Users.fromJson(Map<String, dynamic> json) => Users.fromJson(json);
  /* : firstName= json['firstName'],
        lastName= json['lastName'],
        dob= json['dob'],
        gender= json['gender'];  */

  Map<String, dynamic> toJson() => _$UsersToJson(this);
  /*   {
     // 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender
    };
  */

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        name: json['Name'] as String,
        email: json['lastName'] as String,
        mobile: json['dob'] as String,
        photourl: json['gender'] as String,
        type: json['gender'] as String,
        cat: json['cat'] as String,
        ngoname: json['ngoname'] as String);
  }

  Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
        'Name': instance.name,
        'Email': instance.email,
        'Mobile': instance.mobile,
        'Photourl': instance.photourl,
        'Type': instance.type,
        'cat': instance.cat,
        'ngoname': instance.ngoname
      };
}
