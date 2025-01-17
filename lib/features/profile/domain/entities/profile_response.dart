class ProfileResponse {
  int? status;
  String? message;
  Data? data;

  ProfileResponse({this.status, this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? latitude;
  String? longitude;
  int? radius;
  String? licensePlate;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.latitude,
        this.longitude,
        this.radius,
        this.licensePlate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    radius = json['radius'];
    licensePlate = json['license_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['radius'] = radius;
    data['license_plate'] = licensePlate;
    return data;
  }
}