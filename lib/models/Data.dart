// To parse this JSON data, do
//
//     final needyData = needyDataFromJson(jsonString);

import 'dart:convert';

List<NeedyData> needyDataFromJson(String str) => List<NeedyData>.from(json.decode(str).map((x) => NeedyData.fromJson(x)));

String needyDataToJson(List<NeedyData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NeedyData {
    NeedyData({
        this.srno,
        this.category,
        this.remarks,
        this.requestMob,
        this.requestby,
        this.sex,
        this.age,
        this.imgurl,
        this.latitude,
        this.longitude,
        this.status,
        this.mediatype,
        this.dated,
    });

    int srno;
    String category;
    String remarks;
    String requestMob;
    String requestby;
    String sex;
    String age;
    String imgurl;
    String latitude;
    String longitude;
    String status;
    String mediatype;
    String dated;

    factory NeedyData.fromJson(Map<String, dynamic> json) => NeedyData(
        srno: json["srno"],
        category: json["category"],
        remarks: json["remarks"],
        requestMob: json["requestMob"],
        requestby: json["requestby"],
        sex: json["sex"],
        age: json["age"],
        imgurl: json["imgurl"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
        mediatype: json["mediatype"],
        dated: json["dated"],
    );

    Map<String, dynamic> toJson() => {
        "srno": srno,
        "category": category,
        "remarks": remarks,
        "requestMob": requestMob,
        "requestby": requestby,
        "sex": sex,
        "age": age,
        "imgurl": imgurl,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "mediatype": mediatype,
        "dated": dated,
    };
}
