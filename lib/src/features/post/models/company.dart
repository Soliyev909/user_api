import 'adderss_model.dart';

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  Company.fromJson(Map<String, dynamic> json) {
    address =
        json["address"] != null ? Address.fromJson(json["address"]) : null;
    department = json["department"];
    name = json["name"];
    title = json["title"];
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    if (address != null) {
      data["address"] = address!.toJson();
    }
    data["department"] = department;
    data["name"] = name;
    data["title"] = title;
    return data;
  }


}
