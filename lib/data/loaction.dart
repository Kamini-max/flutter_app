import 'dart:ffi';

class Location {
  String? area = "";
  String? location = "";
  String? geo = "";
  String? address ="";
  String? phone = "";
  String? geometry = "";
   double? lat = 0.0;
   double? lng = 0.0;
  String? email = "";

  Location({this.area, this.location, this.geo,this.address,this.phone,required this.lat,required this.lng,this.email});

  Location.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    location = json['location'];
    geo = json['geo'];
    address = json['address'];
    phone = json['phone'];
    lat = json['geometry']['lat'];
    lng = json['geometry']['lng'];
    email = json['email'];
  }
}
