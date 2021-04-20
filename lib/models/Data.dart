class NeedyData {
  final int id;
  final String category;
  final String remarks;
  final String requestmob;
  final String requestby;
  final String sex;
  final String age;
  final String imgurl;
  final String lat;
  final String longit;
  final String status;
  final String dated;

  NeedyData(
      {this.id,
      this.category,
      this.remarks,
      this.requestmob,
      this.requestby,
      this.sex,
      this.age,
      this.imgurl,
      this.lat,
      this.longit,
      this.status,
      this.dated});

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

  factory NeedyData.fromJson(Map<String, dynamic> json) {
    return NeedyData(
      id: json['srno'] as int,
      category: json['category'] as String,
      remarks: json['remarks'] as String,
      requestmob: json['requestmob'] as String,
      requestby: json['requestby'] as String,
      sex: json['sex'] as String,
      age: json['age'] as String,
      imgurl: json['imgurl'] as String,
      lat: json['latitude'] as String,
      longit: json['longitude'] as String,
      status: json['status'] as String,
      dated: json['dated'] as String,
    );
  }

  Map<String, dynamic> _$UsersToJson(NeedyData instance) => <String, dynamic>{
        'Category': instance.category,
        'Remarks': instance.remarks,
        'Requestmob': instance.requestmob,
        'Requestby': instance.requestby,
        'Sex': instance.sex,
        'Age': instance.age,
        'Imgurl': instance.imgurl,
        'latitude': instance.lat,
        'longitude': instance.longit,
        'Status': instance.status
      };
}
