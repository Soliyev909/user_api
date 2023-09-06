import 'coordinates_model.dart';

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address.fromJson(Map<String, Object?> json) {
    address = json["address"] as String?;
    city = json["city"] as String?;
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json["coordinates"] as Map<String, Object?>)
        : null;
    postalCode = json["postalCode"] as String?;
    state = json["state"] as String?;
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data["address"] = address;
    data["city"] = city;
    if (coordinates != null) {
      data["coordinates"] = coordinates!.toJson();
    }
    data["postalCode"] = postalCode;
    data["state"] = state;
    return data;
  }


}
