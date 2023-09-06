class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, Object?> json) {
    color = json["color"] as String?;
    type = json["type"] as String?;
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data["color"] = color;
    data["type"] = type;
    return data;
  }


}
