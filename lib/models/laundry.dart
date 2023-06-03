import 'dart:convert';

List<Laundry> laundryFromJson(String str) =>
    List<Laundry>.from(json.decode(str).map((x) => Laundry.fromJson(x)));

    
    List<Laundry> laundryFromJson2(String str) =>
    List<Laundry>.from(json.decode(str).map((x) => Laundry.fromJson(x)));
//List<Laundry> myLands=[];
String laundryToJson(List<Laundry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Laundry {
  int? id;
  int? userId;
  String? name;
  String? photo;
  String? phone;
  String? address;
  String? description;
  int? workOrNot;
  int? activeOrNot;
  double? longitude;
  double? latitude;
  bool? favorite;

  Laundry(
      {this.id,
      this.userId,
      this.name,
      this.photo,
      this.phone,
      this.address,
      this.description,
      this.workOrNot,
      this.activeOrNot,
      this.latitude,
      this.longitude,
      this.favorite});

  Laundry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    workOrNot = json['work_or_not'];
    activeOrNot = json['active_or_not'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['description'] = this.description;
    data['work_or_not'] = this.workOrNot;
    data['active_or_not'] = this.activeOrNot;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['favorite'] = this.favorite;

    return data;
  }
}
