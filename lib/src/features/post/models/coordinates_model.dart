class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, Object?> json) {
    lat = json["lat"] as double;
    lng = json["lng"] as double;
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }


}
